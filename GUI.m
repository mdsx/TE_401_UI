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

% Last Modified by GUIDE v2.5 06-Apr-2017 16:23:57

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
%Sometimes the code would have it so the fields do not start at 0 , I'm not
%certain if this fixes that but further testing will show.
global kx
kx=0
global ky
ky=0
global editPhase
global editJ2
global barRight
global barLeft
editPhase=0
editJ2=0
barRight=0
barLeft=0


set(handles.uipanel5, 'Visible','off');

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
global fullpathname
disp(fullpathname)

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
if(isempty(fullpathname)==0)
    set(handles.text12, 'Visible','off');
end
    
%I just set the initial display for the folder path to be "Nothing Loaded"
% global fullpathname;
% if( isempty(fullpathname)==0)
%     set(handles.text3,'String','No Path Loaded')
% else
%     fullpathname = strcat(pathname,filename);
%     set(handles.text3,'String',fullpathname);
% end


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
 text='Button 1 Pressed';%Hard to change text inside the synthetic_holography function since it doesn't take "handles"
 set(handles.textStatus,'String',text);
synthetic_holography(1);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 text='Button 2 Pressed';
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
text='Button 3 Pressed';
set(handles.textStatus,'String',text);
synthetic_holography(3);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text='Button 4 Pressed';
set(handles.textStatus,'String',text);
synthetic_holography(4);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text='Button 5 Pressed';
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
set(handles.uipanel5, 'Visible','off');
set(handles.uipanel3, 'Visible','on');

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel3, 'Visible','off');
set(handles.uipanel5, 'Visible','on');


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

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
 global editKx
 editKx=str2double(get(handles.edit1,'String'))

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global editKy
 editKy=str2double(get(handles.edit1,'String'))

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global editPhase
 editPhase=str2double(get(handles.edit1,'String'))

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global editJ2
 editJ2=str2double(get(handles.edit1,'String'))

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

 function [ ]= synthetic_holography(arg,handles)
 %% Hard coded constant
% do not change
filter_width_x = 1/1; filter_width_y = 1/12;
j1 = 1;



%% User definable constant
% need to be made accessible from GUI
global barRight
global barLeft
global editKx
global editKy
global editPhase
global editJ2
if(isempty(barRight)==1)%I sometimes have an error where the bar returns a null value,
    %this is to handle it. Seems to happen if this has been loaded but not
    %have any values changed yet. Sometimes.
   barRight=0
end
if(isempty(barLeft)==1)
   barLeft=0
end
if(isempty(editKx)==1)
   barLeft=0
end
if(isempty(editKy)==1)
   barLeft=0
end
if(isempty(editPhase)==1)
   barLeft=0
end
if(isempty(editJ2)==1)
   barLeft=0
end



%Default values from martin:
% kx = 0.1;  ky = 305.35;     
% phasekx = -1.5; phaseky = 0.6; 
% phase_offset = 3;
% j2 = 0.94;  

kx = .1 + .5* barLeft;  %this is totally arbitrary values
ky = 305.35+100*barRight;    %this is totally arbitrary values
phasekx = -1.5+editKx; %...
phaseky = 0.6+.5*editKy;          %...
phase_offset = 3+editPhase;       %...
j2 = .94+editJ2;              %...
disp(editKx)
disp(kx)
disp(ky)
disp(phasekx)
disp(phaseky)
disp(phase_offset)
disp(j2)


%% Read image
global fullpathname
if( isempty(fullpathname)==1)
    %By default use the holo.png image.... if we're sending this out to a
    %client it should probably be something along the lines of "NO IMAGE
    %LOADED" ... I'll fix that up later tonight probably. 
    fname = 'holo.png';
    holo = imread( fname );
else
    %This part is necessary incase the file needs to have it's array values
    %shifted around. 
    i=imread(fullpathname);
    image = i(:, :, 1);
    
    [y1,x1,z1] = size(image);
    if(x1~=y1)
    holo = double(imread(image)); %if the variables below do not display PIXEL (ie 256 256 1) use this if not use other
    else
    holo = double(image);
    
    end
disp(fullpathname)
end

if(arg==1)

figure(1); imagesc(abs(holo)); colormap 'gray';
end


%% Do reconstruction - FFT
holo_fft = fftshift(fft2(holo)); holo_fft_max = max(max(abs(holo_fft)));
if(arg==2)
figure(2); imagesc(abs(holo_fft)); caxis( [ 0 holo_fft_max/1000] ); colormap 'jet';
end
%% Do reconstruction - Create Filters

% calculate window functions
temp = size( holo ); Ny = temp(1); Nx = temp(2);
[X,Y] = meshgrid(1:Nx, 1:Ny);
windowX = Nx/2+kx+1;
windowY = Ny/2+(ky+1);
windowW = Nx*filter_width_x/1.0;
windowH = Ny*filter_width_y/1.0;
        
filter1 = 0.4 + 0.6 * cos( (Y-windowY) / windowH * pi*0.6 );
filter2 = ( 0.4 + 0.6 * cos( (X-windowX) / windowW * pi*0.6 ) );
mask1 = abs(Y-windowY) < windowH;
mask2 = abs(X-windowX) < windowW;
holo_window = filter1.*filter2.*mask1.*mask2;        
        
windowX = Nx/2+2*kx+1;
windowY =  Ny/2+(2*ky+1);
filter1 = 0.4 + 0.6 * cos( (Y-windowY) / windowH * pi*0.6 );
filter2 = ( 0.4 + 0.6 * cos( (X-windowX) / windowW * pi*0.6 ) );
mask1 = abs(Y-windowY) < windowH;
mask2 = abs(X-windowX) < windowW;
holo_window2 = filter1.*filter2.*mask1.*mask2;        

% calculate phase correction
holo_phasecorr1= exp( -2*pi*1i*Y/Ny*ky ) .* exp( -2*pi*1i*X/Nx*kx ) ;%* exp( 1i*phase_offset);
holo_phasecorr2= exp( -2*pi*1i*Y/Ny*2*ky ) .* exp( -2*pi*1i*X/Nx*2*kx );% * exp( 1i*2*phase_offset);
        
% calculate phase correction for final image
holo_phasecorr = exp( -2*pi*1i*Y/Ny*phaseky ) .* exp( -2*pi*1i*X/Nx*phasekx ) * exp( 1i*phase_offset); 

%% Reconstruction -- Apply filters & Inverse FT
holo_fft1 = holo_fft .* holo_window;
holo_fft2 = holo_fft .* holo_window2;

% Do inverse FFT
holo_reco1 = ifft2( fftshift(holo_fft1) ) .* holo_phasecorr1;
holo_reco2 = ifft2( fftshift(holo_fft2) ) .* holo_phasecorr2;

%% Phase shift

% Do statistics and shift phase in real, imag images
[histcnt,histbin] = histcounts( angle(holo_reco1(:)), 100);
[histmax,histmaxind] = max(histcnt);
histmaxpos = histbin(histmaxind);
histphase_offset = histmaxpos;
holo_reco1 = holo_reco1 .* exp(-1i * histphase_offset);
holo_reco2 = holo_reco2 .* exp(-1i * 2*histphase_offset);

hmax = max( max(max(abs(holo_reco1))), max(max(abs(holo_reco2)))); 
if(arg==3)
figure(3);
subplot(2,3,1); imagesc( abs(holo_reco1) ); caxis([ 0 hmax] );
subplot(2,3,2); imagesc( angle(holo_reco1) ); caxis([ -3.14 3.14]);
subplot(2,3,3); hist( angle(holo_reco1(:)), 100);
subplot(2,3,4); imagesc( abs(holo_reco2) ); caxis([ 0 hmax] );
subplot(2,3,5); imagesc( angle(holo_reco2) ); caxis([ -3.14 3.14]);
subplot(2,3,6); hist( angle(holo_reco2(:)), 100);
end

%% Compose final image
holo_reco = j1*real(holo_reco1) + j2*1i* real(holo_reco2);

% correct phase
holo_reco = holo_reco .* holo_phasecorr;
if(arg==4)
figure(4); imagesc( abs(holo_reco) ); colormap 'gray';
end
if(arg==5)
figure(5); imagesc( angle(holo_reco) ); colormap 'gray';
end
