% Hologram Creation
clear all; clc; clf;

%% Parameters:
image = 'cameraman.tif';    % image to reconstruct

a = 8.5e0;                  % phase equation constant []
b = 5.2e-3;                 % phase equation constant []
k = @(t) (a*t);             % user-determined phase equation

t = 0;                      % initial time [us]
dt = 1;                     % time step [us]

filter_width = 144;         % width of Fourier filter []
filter_center_x = 77;       % x-position center of Fourier filter []
filter_center_y = 440;      % y-position center of Fourier filter []

k_y = 0.2291;               % reference wave k_y component [1/nm]
k_x = 0.0023;               % reference wave k_x component [1/nm]

%% Image Preparation
Image = double(imread(image));
Image = upsample(Image,2);                                              % upsample data points
Image = upsample(Image',2)';
Image = imfilter(Image,fspecial('gaussian',[10,10],2),'symmetric');     % apply Guassian filter
[N, ~] = size(Image);                                                   % assuming image is N x N dimensions

%% Construct Reference Field
U_r = zeros(N);             % reference field is plane wave
for y = 1:N
    for x = 1:N
        U_r(y,x) = exp(-1i*k(t));
        t = t + dt;
    end
end

%% Hologram
hologram = Image + U_r;                 % field
hologram = hologram.*conj(hologram);    % intensity

figure(1);
imagesc(hologram);
title('Hologram - Space Domain');
colormap gray;

%% Fourier Domain
holo_FT = fft2(hologram);
holo_FT = fftshift(holo_FT);

figure(2);
imagesc(abs(holo_FT));
title('Hologram - Fourier Domain');
caxis(caxis().*[0,0.01]);               % easier to determine frequency peaks

%% Filter
holo_filter = zeros(N);
patch = fspecial('gaussian',[filter_width+1,filter_width+1],filter_width/4);
holo_filter(filter_center_y-filter_width/2:filter_center_y+filter_width/2, ...
            filter_center_x-filter_width/2:filter_center_x+filter_width/2) = patch;   % bandpass filter
holo_FT = holo_FT.*holo_filter;

figure(3);
imagesc(abs(holo_FT));
title('Filtered Hologram');

%% Space Domain
holo_IFT = fftshift(holo_FT);
holo_IFT = ifft2(holo_IFT);

figure(4);
subplot(1,2,1);
imagesc(abs(holo_IFT));
title('Amplitude');
subplot(1,2,2);
imagesc(angle(holo_IFT));
title('Phase');
suptitle('Hologram');
colormap gray;

%% Reconstruction
plane_wave = zeros(N);              % plane wave to match reference field
k_plane = 2*pi * [k_y, k_x];        % plane wave k-vector
for y = 1:N
    for x = 1:N
        plane_wave(y,x) = exp(-1i*(k_plane(1)*y+k_plane(2)*x));
    end
end

reconstruction = holo_IFT.*plane_wave;

figure(5);
subplot(2,2,1);
imagesc(abs(Image));
title('Amplitude');
subplot(2,2,2);
imagesc(angle(Image));
title('Phase');
subplot(2,2,3);
imagesc(abs(reconstruction));
title('Amplitude');
subplot(2,2,4);
imagesc(angle(reconstruction));
title('Phase');
suptitle(sprintf('Image vs \n Reconstruction'));
colormap gray;
