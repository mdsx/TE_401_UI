function varargout = GUI(varargin)

% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 16-Mar-2017 23:05:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
global five
five = 5;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI

handles.output = hObject;
bg_image=imread('\\ad.uillinois.edu\engr\instructional\zwasser2\Desktop\Photoshop\Run.jpg');
set(handles.pushbutton10,'CData',bg_image);

bg_image1=imread('\\ad.uillinois.edu\engr\instructional\zwasser2\Desktop\Photoshop\Scan.jpg');
set(handles.pushbutton11,'CData',bg_image1);

bg_image2=imread('\\ad.uillinois.edu\engr\instructional\zwasser2\Desktop\Photoshop\F.jpg');
set(handles.pushbutton13,'CData',bg_image2);

bg_image3=imread('\\ad.uillinois.edu\engr\instructional\zwasser2\Desktop\Photoshop\MightyUlm2.jpg');
set(handles.pushbutton14,'CData',bg_image3);

bg_image4=imread('\\ad.uillinois.edu\engr\instructional\zwasser2\Desktop\Photoshop\Smile.jpg');
set(handles.pushbutton15,'CData',bg_image4);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
[filename pathname] = uigetfile({'*.png;,*.jpeg;'},'File Selector');
global fullpathname;
fullpathname = strcat(pathname,filename);
set(handles.text3,'String',fullpathname);


%bg_image=imread(fullpathname);
%set(handles.pushbutton10,'CData',bg_image);
%bg_image1=imread(fullpathname);
%set(handles.pushbutton11,'CData',bg_image1);
%bg_image2=imread(fullpathname);
%set(handles.pushbutton13,'CData',bg_image2);
%bg_image3=imread(fullpathname);
%set(handles.pushbutton14,'CData',bg_image3);
%bg_image4=mread(fullpathname);
%set(handles.pushbutton15,'CData',bg_image4);
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 text='Gausian Filtered Image';%Hard to change text inside the synthetic_holography function since it doesn't take "handles"
 set(handles.textStatus,'String',text);
synthetic_holography(1);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 text='Image vs Reconstruction';
 set(handles.textStatus,'String',text);
synthetic_holography(2);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text='Fourier';
set(handles.textStatus,'String',text);
synthetic_holography(3);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text='Filtered Image';
set(handles.textStatus,'String',text);
synthetic_holography(4);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text='Resolved Imaging';
set(handles.textStatus,'String',text);
synthetic_holography(5);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel4, 'Visible','off');
set(handles.uipanel3, 'Visible','on');

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel3, 'Visible','off');
set(handles.uipanel4, 'Visible','on');


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global barLeft
barLeft=get(hObject,'Value');

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%Goes from 0 to 1 for reference
global barRight
barRight=get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function [ ]= synthetic_holography(arg,handles)
% Hologram Creation

%fullpathname = strcat(pathname,filename);
%% Parameters:
global fullpathname; %The read image must be NxN dimensions!(tested with 256X256)
i=imread(fullpathname);
%image =  imshow(imadjust(i(:,:,1)));    % image to reconstruct
image = i(:, :, 1);
%image ='cameraman.tif';
%greenChannel = i(:, :, 2);
%blueChannel = i(:, :, 3);
%We only use grayscale of image, so the green/blue is not needed.
% Recombine separate color channels into an RGB image.
%image = cat(3, redChannel, greenChannel, blueChannel);


a = 8.5e0;                  % phase equation constant []
b = 5.2e-3;                 % phase equation constant []
k = @(t) (a*t);             % user-determined phase equation

t = 0;                      % initial time [us]
dt = 1;                     % time step [us]

filter_width = 144;         % width of Fourier filter []
filter_center_x = 77;       % x-position center of Fourier filter []
filter_center_y = 440;      % y-position center of Fourier filter []
%317 to 336 not on 318 to 323
k_y = 0.2291;               % reference wave k_y component [1/nm]
k_x = 0.0023;               % reference wave k_x component [1/nm]

%% Image Preparation
[y1,x1,z1] = size(image);
disp(y1);
disp(x1);
disp(z1);
if(x1~=y1)
    Image = double(imread(image)); %if the variables below do not display PIXEL (ie 256 256 1) use this if not use other
else
    Image = double(image); %this is pretty much based on how we read this file
    %For example, loading in the cameraman.tif will use the
    %double(imread(...)) while the NxN image uploaded from a computer (from
    %my testing) ususally used just double(...)
end
% [y1,x1,z1] = size(Image);
% disp(y1);
% disp(x1);
% disp(z1);
Image = upsample(Image,2);
Image = upsample(Image',2)';
Image = imfilter(Image,fspecial('gaussian',[10,10],2),'symmetric');
% apply Guassian filter
[N, ~] = size(Image);      % assuming image is N x N dimensions
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

if(arg==1)
   figure(1);
   %original image i think
   %set(handles.text3,'String',fullpathname);
   imshow(hologram);
end
imagesc(hologram);
title('Hologram - Space Domain');
colormap gray;

%% Fourier Domain
holo_FT = fft2(hologram);
holo_FT = fftshift(holo_FT);

if(arg==2)
    %image vs reconstruction
    figure(2);
    imshow(holo_FT);
end
imagesc(abs(holo_FT));
title('Hologram - Fourier Domain');
caxis(caxis().*[0,0.01]);               % easier to determine frequency peaks

%% Filter
holo_filter = zeros(N);
patch = fspecial('gaussian',[filter_width+1,filter_width+1],filter_width/4);

holo_filter(filter_center_y-filter_width/2:filter_center_y+filter_width/2, ...
             filter_center_x-filter_width/2:filter_center_x+filter_width/2) = patch;   % bandpass filter


if(arg==3)
    %fourier
    figure(3);
    imshow(holo_FT);
end
imagesc(abs(holo_FT));
title('Filtered Hologram');

%% Space Domain
holo_IFT = fftshift(holo_FT);
holo_IFT = ifft2(holo_IFT);
if(arg==4)
    %filtered
   figure(4);
    imshow(holo_IFT);
end
subplot(1,2,1);
imagesc(abs(holo_IFT));
title('Amplitude');
subplot(1,2,2);
imagesc(angle(holo_IFT));
title('Phase');
suptitle('Hologram');
global barLeft;
if(barLeft<.5)
    colormap gray;
else
    colormap summer;
end
% colormap gray;

%% Reconstruction
plane_wave = zeros(N);              % plane wave to match reference field
k_plane = 2*pi * [k_y, k_x];        % plane wave k-vector
for y = 1:N
    for x = 1:N
        plane_wave(y,x) = exp(-1i*(k_plane(1)*y+k_plane(2)*x));
    end
end

reconstruction = holo_IFT.*plane_wave;
if(arg==5)
    %resolved imaging
    figure(5);
    imshow(reconstruction);
end
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
