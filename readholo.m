clear;flag_firstrun = 1;
flag_notch = 0;
flag_movie = 0; 
flag_figures = 1;
colormapgreyscale = importdata('colortable_greyscale.txt');
colormapgreyscale = colormapgreyscale /255;
colormapjet = importdata('colortable_jet.txt');
colormapjet = colormapjet /255;

image_no = 0;
j1 = 1;
j2 = 1;

for q=1:1
%read image  
flag_notread = 1;

while(flag_notread);
try    
    holo = imread('holo_cheek1.png'); %single file
   %image_no=1; holo = imread('c:\inbox\holo.tif',image_no); j2=1; %single file
%    image_no=2; holo = imread('c:\inbox\holo.tif',image_no); j2=1.06;  %single file
    %image_no=2; holo = imread('c:\inbox\holo.tif',image_no); j2=1;  %single file

%    image_no=1; holo = imread('c:\inbox\usaf_487_513_560_take1_DAPI.tif',8); j2=0.9;%single file
%    image_no=2; holo = imread('c:\inbox\usaf_487_513_560_take1_Cy5.tif',8); j2=1.2;%single file
%    image_no=1; holo = imread('c:\inbox\onion7_487_513_560_take1_EGFP.tif',10); j2=1.0;%single file
%    image_no=2; holo = imread('c:\inbox\onion7_487_513_560_take1_Cy5.tif',10); j2=1.2;%single file
%    image_no=2; holo = imread('c:\inbox\onion1_487_513_take4_39hz_Cy5.tif',10); j2=1.06;%single file
%    flag_movie = 1; holo = imread('c:\inbox\cheek4_2048_6x_487_513_take1_Cy5.tif',q); j2=1.06;%single file

    %holo = imread('C:\inbox\onion_on_mirror\soh1024_1p1\soh1024_1p1.tif',q);
    %holo = imread('C:\inbox\onion_on_mirror\soh512_fast\soh512_fast.tif',q);
    %holo = imread('C:\inbox\onion_on_mirror\soh512_fast_take2\soh512_fast_take2.tif',q);
    %holo = imread('C:\inbox\20160528_onion_mirror_800mV.tif',q); flag_movie = 1;
    %holo = imread('C:\inbox\20160528_onion_mirror_530mV.tif',q); flag_movie = 1;
    
    %holo = imread('C:\inbox\beads.tif',q); flag_movie = 1;
    %holo = imread('C:\inbox\beads_nearmirror.tif',q); flag_movie = 1;
    
    flag_notread=0;
catch
    pause(0.5);
end
end


    
if( flag_movie && flag_firstrun )
vobj = VideoWriter('intensity.avi','Uncompressed AVI');
open(vobj);
end;

holo_fft = fftshift(fft2(holo)); holo_fft_max = max(max(abs(holo_fft)));
holo_fft0 = holo_fft;
if(flag_figures)
%figure(1); imagesc(abs(holo)); colormap 'gray';
figure(11); imagesc(abs(holo_fft)); caxis( [ 0 holo_fft_max/1000] ); colormap 'jet';
%figure(12); imagesc(angle(holo_fft));
%figure(13); imagesc(real(holo_fft));caxis( [ 0 holo_fft_max/1000] ); colormap 'jet';
%return
end
if(1) % 0=only show ft, 1=do full reconstruction
%break
%set parameters
%ky = 70.0;  kx = 0.05; % 512px, 8 zoom; fast mode, 355 hz, 800mV (old530mV) no term
%ky = 146.9;  kx = 0.1; % 1024px, 1.25 zoom; 560nm: 70hz, 379Vpp
%ky = 140.0;  kx = 0.05; % 1024px, 8 zoom; 70 Hz, 410mVpp, 10Ohm term
%ky = 305.4;  kx = 0.1; flag_notch = 1; notch_cnt = 1; notch(1,1:4) = [1024,1546,5,5]; % 2048px, 8 zoom; 40 Hz, 230mVpp, 10Ohm term
%ky = 305.4;  kx = 0.1; flag_notch = 1; notch_cnt = 1; notch(1,1:4) = [1024,1546,15,15]; % 2048px, 2.5 zoom; 38.4Hz, 220mVpp (639nm) 200mV (560nm), 10Ohm term
%ky = 313;  kx = 0.1; % 2048px, 4 zoom; 41 Hz, 177mVpp (513nm), 10Ohm term
%ky = 305.25;  kx = 0.1; % 2048px, 3zoom, 39 Hz, 177mVpp (513nm), 10Ohm term
%ky = 312.8;  kx = 0.1; % 2048px, 3zoom, 39.2 Hz, 177mVpp (513nm), 10Ohm term
%ky = 310;  kx = 0.1; % 2048px, 2.5 zoom; 39 Hz, 230mVpp, 10Ohm term
%ky = 313;  kx = 0.1; % 2048px, 1.25 zoom; 40 Hz, 230mVpp, 10Ohm term
ky = 305.5;  kx = 0.1; % 2048px, 4 zoom; 40 Hz, 177mVpp, 10Ohm term
%ky = 313;  kx = 0.1; % 2048px, 8 zoom; 41 Hz, 177mVpp, 10Ohm term
%ky = 310;  kx = 0.1; % 2048px, 2.5 zoom; 41 Hz, 177mVpp, 10Ohm term
%ky = 313;  kx = 0.1; flag_notch = 1; notch_cnt = 4; notch(1,1:4) = [1018,1820,10,10]; notch(2,1:4) = [1032,1821,5,5]; notch(3,1:4) = [1019,1508,5,5]; notch(4,1:4) = [1031,1508,5,5];  % 2048px, 1.2 zoom; 40 Hz, 204mVpp (560nm), 10Ohm term
%ky = 315;  kx = 0.1; flag_notch = 1; notch_cnt = 4; notch(1,1:4) = [1018,1498,5,5]; notch(2,1:4) = [1032,1498,5,5]; notch(3,1:4) = [1017,1813,15,15]; notch(4,1:4) = [1033,1813,15,15];  % 2048px, 1 zoom; 40.39 Hz, 204mVpp, 10Ohm term
%ky = 600;  kx = 0.1; flag_notch = 1; notch_cnt = 2; notch(1,1:4) = [2056,3140,10,5]; notch(2,1:4) = [2041,3150,10,5]; % 4096px, 1.25 zoom; 25.71 Hz, 140mVpp, 10Ohm term
%ky = 615;  kx = 0.1; flag_notch = 1; notch_cnt = 4; notch(1,1:4) = [2041,3684,10,10]; notch(2,1:4) = [2056,3681,10,10]; notch(3,1:4) = [2042,3070,5,5]; notch(4,1:4) = [2055,3070,10,5]; % 4096px, 1.2 zoom; 25.71 Hz, 140mVpp, 10Ohm term
%ky = 600;  kx = 0.1; flag_notch = 1; notch_cnt = 2; notch(1,1:4) = [2056,3140,10,5]; notch(2,1:4) = [2041,3150,10,5]; % 4096px, 1.00 zoom; 25.78 Hz, 137mVpp, 10Ohm term
phase_offset = 2;
filter_width_x = 1/1; filter_width_y = 1/12;



temp = size( holo ); Ny = temp(1); Nx = temp(2);
 %create window function
 if(flag_firstrun)
 N = Nx;
 crop_x_width = Nx*filter_width_x/1.0;
 crop_y_width = Ny*filter_width_y/1.0; %should be N/4, but a slightly lower value is better
        jpk_window(1:Ny,1:Nx) = 0;
        jpk_window2(1:Ny,1:Nx) = 0;
        crop_x_center = Nx/2+kx+1;
        crop_y_center = Ny/2+(ky+1);
        for yQ=1:Ny
        for xQ=1:Nx
            %wvalue = exp( -(yQ-crop_y_center)^2/(crop_y_width^2/2)) * exp( -(xQ-crop_x_center)^2/(crop_x_width^2/2));
            if abs(yQ-crop_y_center) < crop_y_width 
            if abs(xQ-crop_x_center) < crop_x_width 
            wvalue = 0.4 + 0.6 * cos( (yQ-crop_y_center) / crop_y_width * pi*0.6 ) ;
            wvalue = wvalue * ( 0.4 + 0.6 * cos( (xQ-crop_x_center) / crop_x_width * pi*0.6 ) );
            jpk_window(yQ,xQ) = wvalue; 
            end
            end
        end
        end
        crop_x_center = Nx/2+kx+1;
        crop_y_center = Ny/2+(ky*2+1);
        for yQ=1:Ny
        for xQ=1:Nx
            %wvalue = exp( -(yQ-crop_y_center)^2/(crop_y_width^2/2)) * exp( -(xQ-crop_x_center)^2/(crop_x_width^2/2));
            if abs(yQ-crop_y_center) < crop_y_width 
            if abs(xQ-crop_x_center) < crop_x_width 
            wvalue = 0.4 + 0.6 * cos( (yQ-crop_y_center) / crop_y_width * pi*0.6 ) ;
            wvalue = wvalue * ( 0.4 + 0.6 * cos( (xQ-crop_x_center) / crop_x_width * pi*0.6 ) );
            jpk_window2(yQ,xQ) = wvalue; 
            end
            end
        end
        end
 end
 
 
 
 
 % FFT again, filter, iFFT
 if(flag_notch)
     if(1)
        clear jpk_notch; jpk_notch(1:Ny,1:Nx) = 1;
        for(cn=1:notch_cnt)
        remove_x_center = notch(cn,1); remove_y_center = notch(cn,2);
        remove_x_width = notch(cn,3); remove_y_width = notch(cn,4);
        for yQ=1:Ny
        for xQ=1:Nx
            wvalue = 1-exp( -(yQ-remove_y_center)^2/(remove_y_width^2/2)) * exp( -(xQ-remove_x_center)^2/(remove_x_width^2/2));
            jpk_notch(yQ,xQ) = jpk_notch(yQ,xQ) * wvalue; 
        end
        end
        holo_fft = holo_fft .* jpk_notch;
        end        
     end
 end
 
 
 
 
 
 
 holo_fft1 = holo_fft .* jpk_window;
 holo_fft2 = holo_fft .* jpk_window2;
  
        if(0)
        %figure(8);        imagesc( jpk_window + jpk_window2);        colormap('gray');
        figure(9);
        subplot(2,1,1); imagesc( abs(holo_fft1) ); caxis( [ 0 holo_fft_max/1000] );
        subplot(2,1,2); imagesc( abs(holo_fft2) ); caxis( [ 0 holo_fft_max/1000] );
        colormap 'jet';
        end
 
        
        
 
        
        
        
        
               
 holo_reco1 = ifft2( fftshift(holo_fft1) );
 holo_reco2 = ifft2( fftshift(holo_fft2) );

 
 
 
 
 
 

 % correct phase gradient
 if(flag_firstrun)
  jpk_phase_correction1(1:Ny,1:Nx) = 0;
 jpk_phase_correction2(1:Ny,1:Nx) = 0;
 for yQ=1:Ny
 for xQ=1:Nx
     wvalue = exp( -2*pi*i*yQ/Ny*ky ) * exp( -2*pi*i*xQ/Nx*kx ) ;
     jpk_phase_correction1(yQ,xQ) = wvalue; 
     wvalue = exp( -2*pi*i*yQ/Ny*(ky*2) ) * exp( -2*pi*i*xQ/Nx*kx ) ;
     jpk_phase_correction2(yQ,xQ) = wvalue; 
 end
 end
 end
 holo_reco1 = holo_reco1 .* jpk_phase_correction1;
 holo_reco2 = holo_reco2 .* jpk_phase_correction2;
% holo_reco1 = holo_reco1 .* exp(-1i * angle(holo_reco1(1,1)));
% holo_reco2 = holo_reco2 .* exp(-1i * angle(holo_reco2(1,1)));
 holophase = holo_reco1 ./ abs(holo_reco1);
 phaseavg = sum(sum(holophase)) / Nx / Ny;
 %phase_offset = angle(qavg);
 phase_offset = 0;
 holo_reco1 = holo_reco1 .* exp(-1i * phase_offset);
 holo_reco2 = holo_reco2 .* exp(-1i * 2*phase_offset);

 [histcnt,histbin] = histcounts( angle(holo_reco1(:)), 100);
 [histmax,histmaxind] = max(histcnt);
 histmaxpos = histbin(histmaxind);
 phase_offset = histmaxpos;
 holo_reco1 = holo_reco1 .* exp(-1i * phase_offset);
 holo_reco2 = holo_reco2 .* exp(-1i * 2*phase_offset);

 
 %holo_reco2 = holo_reco2 * 600/260;
 
 hmax = max( max(max(abs(holo_reco1))), max(max(abs(holo_reco2)))); 
 if(flag_figures)
 figure(3);
 subplot(2,4,1); imagesc( abs(holo_reco1) ); caxis([ 0 hmax] );
 subplot(2,4,2); imagesc( angle(holo_reco1) ); caxis([ -3.14 3.14]);
 subplot(2,4,3); hist( angle(holo_reco1(:)), 100);
 subplot(2,4,5); imagesc( abs(holo_reco2) ); caxis([ 0 hmax] );
 subplot(2,4,6); imagesc( angle(holo_reco2) ); caxis([ -3.14 3.14]);
 subplot(2,4,7); hist( angle(holo_reco2(:)), 100);
 end
 
 
 %break
 % treshold phase
 if(1)
 tmp = holo_reco1; qpos = abs(angle(holo_reco1)) < pi/2; qneg = abs(angle(holo_reco1)) >= pi/2; tmp(qpos) = 1; tmp(qneg) = -1; holo_reco1 = abs(holo_reco1) .* tmp;
 tmp = holo_reco2; qpos = abs(angle(holo_reco2)) < pi/2; qneg = abs(angle(holo_reco2)) >= pi/2; tmp(qpos) = 1; tmp(qneg) = -1; holo_reco2 = abs(holo_reco2) .* tmp;
 if(flag_figures)
 figure(3);
 subplot(2,4,4); imagesc( angle(holo_reco1) ); caxis([ -3.14 3.14]);
 subplot(2,4,8); imagesc( angle(holo_reco2) ); caxis([ -3.14 3.14]);
 end
 end
 %figure(4); qx = 200; q1 = holo_reco1(:,qx); q2 = holo_reco2(:,qx); ty = linspace(1,Ny,Ny);plot( ty, [abs(q1),abs(q2)]); 


 
 
 %holo_reco = real(holo_reco1) + 1i * real(holo_reco2);
 %holo_reco = 110*(holo_reco1) + 90* 1i* (holo_reco2);
 %holo_reco = 110*abs(holo_reco1) + 88* 1i* abs(holo_reco2);
 %holo_reco = 110*real(holo_reco1) + 88* 1i* real(holo_reco2);
 holo_reco = j1*real(holo_reco1) + j2*1i* real(holo_reco2);
 
 
 
 if(0)
 for yQ=1:Ny
     avgvalue = 0;     avgvalue2 = -20*pi;
     avgline = linspace(avgvalue, avgvalue2, Nx);
     holo_reco(yQ,:) = holo_reco(yQ,:) ./ exp(1i*avgline);
 end
 for xQ=1:Nx
     avgvalue = 0;     avgvalue2 = 7*pi;
     avgline = linspace(avgvalue, avgvalue2, Ny);
     holo_reco(:,xQ) = holo_reco(:,xQ) ./ transpose(exp(1i*avgline));
 end
 end
 
 
  
if(flag_movie)
 %calc mean phase and subtract from image
 %Nx = 720; Ny = 720;
 avgtmp  = 0;
 avgvalue  = 0;
 avgcnt  = 0;
 for yQ=1:Ny
 for xQ=1:100
     avgvalue  = avgvalue  + holo_reco(yQ,xQ)/abs(holo_reco(yQ,xQ));  avgcnt  = avgcnt  + 1;
 end
 for xQ=622:Nx
     avgvalue  = avgvalue  + holo_reco(yQ,xQ)/abs(holo_reco(yQ,xQ));  avgcnt  = avgcnt  + 1;
 end

 end
 if( avgcnt >0 )
     avgvalue  = avgvalue  / avgcnt ;
     holo_reco(:,:) = holo_reco(:,:) ./ avgvalue ;
 end
 
 [a,b] = hist(angle(holo_reco(:)),50);
 %if( mean(mean(angle(holo_reco))) < 1 ) holo_reco = conj(holo_reco); end;
 %if( max(a) < 10000 ) holo_reco = conj(holo_reco); end;
 

 if(0)
 for yQ=1:Ny
     avgvalue = 0;     avgvalue2 = -1.3*pi;
     avgline = linspace(avgvalue, avgvalue2, Nx);
     holo_reco(yQ,:) = holo_reco(yQ,:) ./ exp(1i*avgline);
 end
 for xQ=1:Nx
     avgvalue = 0;     avgvalue2 = -2.8*pi;
     avgline = linspace(avgvalue, avgvalue2, Ny);
     holo_reco(:,xQ) = holo_reco(:,xQ) ./ transpose(exp(1i*avgline));
 end
 end
  [a,b] = hist(angle(holo_reco(:)),50);
 if( max(a) < 10000 ) 
     holo_reco = conj(holo_reco); 
      for yQ=1:Ny
     avgvalue = 0;     avgvalue2 = -2*1.3*pi;
     avgline = linspace(avgvalue, avgvalue2, Nx);
     holo_reco(yQ,:) = holo_reco(yQ,:) ./ exp(1i*avgline);
 end
 for xQ=1:Nx
     avgvalue = 0;     avgvalue2 = -2*2.8*pi;
     avgline = linspace(avgvalue, avgvalue2, Ny);
     holo_reco(:,xQ) = holo_reco(:,xQ) ./ transpose(exp(1i*avgline));
 end
 
 end;
    


 figure(42); imagesc( angle(holo_reco) ); caxis([ -3.14 3.14]); colormap 'gray';
 
 
 
 %a = double(angle(holo_reco)); a=(a+2)/(3);a(a<0)=0; a(a>1)=1;  ai = uint8(a*255);
 a = double(angle(holo_reco)); a=(a+pi)/(2*pi);a(a<0)=0; a(a>1)=1;  ai = uint8(a*255);
 imwrite(ai,colormapgreyscale, strcat('composition_',num2str(q),'.png'), 'png' );


  writeVideo( vobj, a);
end

 

 %holo_reco = 1*real(holo_reco1) + 1* 1i* real(holo_reco2);
 holo_reco_max = max(max(abs(holo_reco)));
 %figure(4); subplot(2,1,1); imagesc( abs(holo_reco) ); caxis([ 0 holo_reco_max]); subplot(2,1,2); imagesc( angle(holo_reco) ); caxis([ -3.14 3.14]);
 figure(4); imagesc( abs(holo_reco) ); caxis([ 0 holo_reco_max]); colormap 'gray';
 figure(41); imagesc( angle(holo_reco) ); caxis([ -3.14 3.14]); colormap 'gray';
 %caxis([-2 1]);
 

 
 %figure(6); qx = 200; q = holo_reco(:,qx); ty = linspace(1,Ny,Ny); subplot(2,1,1); plot( ty, abs(q) );  subplot(2,1,2); plot( ty, angle(q) ); 


%pause(1);
drawnow;
else
    pause(1);
    q
end
flag_firstrun = 0;
%save(strcat('holo_reco_take2_',num2str(q)),'holo_reco');
end
if(flag_movie) close(vobj); end;

if(image_no==1) save('holo_reco1','holo_reco'); end;
if(image_no==2) save('holo_reco2','holo_reco'); end;
if(image_no==3) save('holo_reco3','holo_reco'); end;

return;


%  level
% user-defined mask
if(1)
 
 for yQ=1:Ny
 avgtmp = 0;
 avgvalue = 0;avgvalue2 = 0;
 avgcnt = 0; avgcnt2 = 0;
 for xQ=420:480
     avgvalue = avgvalue + holo_reco(yQ,xQ)/abs(holo_reco(yQ,xQ));  avgcnt = avgcnt + 1;
 end
 for xQ=Nx:Nx
     avgvalue2 = avgvalue2 + holo_reco(yQ,xQ)/abs(holo_reco(yQ,xQ));  avgcnt2 = avgcnt2 + 1;
 end

 if( avgcnt>0 ) 
     %line level
     %avgvalue = angle(avgvalue / avgcnt);
     %avgvalue2 = angle(avgvalue2 / avgcnt2);
     %avgline = linspace(avgvalue, avgvalue2, Nx); 
     %holo_reco(yQ,:) = holo_reco(yQ,:) ./ exp(1i*avgline);
     
     %constant level
     avgvalue = angle( (avgvalue/avgcnt + avgvalue/avgcnt2)/2 );
     holo_reco(yQ,:) = holo_reco(yQ,:) .* exp(-1i * avgvalue);
     
 end
end
end
  figure(42); imagesc( angle(holo_reco) ); caxis([ -3.14 3.14]); colormap 'gray';
 
  
  
  
  
 %figure(41); imagesc(angle(holo_reco)); caxis([ -3.2 3.2] );  colormap('gray');
holo_reco1 = holo_reco;
 
  %manual phase correction
  %1.25x 4096: -12.8, 4.6
  %8x 2048: 14.5/ -0.2
  %2.5x 2048: 2.7/ -1
  holo_reco = holo_reco1;
 if(1)
 for yQ=1:Ny
     avgvalue = 0;     avgvalue2 = -2.9*pi;
     avgline = linspace(avgvalue, avgvalue2, Nx);
     holo_reco(yQ,:) = holo_reco(yQ,:) ./ exp(1i*avgline);
 end
 for xQ=1:Nx
     avgvalue = 0;     avgvalue2 =-2*pi;
     avgline = linspace(avgvalue, avgvalue2, Ny);
     holo_reco(:,xQ) = holo_reco(:,xQ) ./ transpose(exp(1i*avgline));
 end
 end
 figure(42); imagesc( angle(holo_reco) ); caxis([ -3.14 3.14]); colormap 'gray';
 
 
 
 
 

colormapgreyscale = importdata('colortable_greyscale.txt');
colormapgreyscale = colormapgreyscale /255;
colormapjet = importdata('colortable_jet.txt');
colormapjet = colormapjet /255;
clear a; a = double(abs(holo)); a = a / max(max(a));  a = uint8(a * 255);imwrite(a,colormapgreyscale, 'holo.png', 'png' );
clear a; a = double(abs(holo_fft0)); a = a / max(max(a))*1000;  a = uint8(a * 255);imwrite(a,colormapjet, 'holo_fft.png', 'png' );
clear a; a = double(abs(holo_reco)); a = a / max(max(a));  a = uint8(a * 255);imwrite(a,colormapgreyscale, 'holo_reco_abs.png', 'png' );
clear a; a = double(angle(holo_reco)); a = (a+pi)/2/pi;  a = uint8(a * 255);imwrite(a,colormapgreyscale, 'holo_reco_angle.png', 'png' );

