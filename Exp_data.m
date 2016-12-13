function varargout = Exp_data(varargin)
% EXP_DATA MATLAB code for Exp_data.fig
%      EXP_DATA, by itself, creates a new EXP_DATA or raises the existing
%      singleton*.
%
%      H = EXP_DATA returns the handle to a new EXP_DATA or the handle to
%      the existing singleton*.
%
%      EXP_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXP_DATA.M with the given input arguments.
%
%      EXP_DATA('Property','Value',...) creates a new EXP_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exp_data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exp_data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exp_data

% Last Modified by GUIDE v2.5 12-Dec-2016 12:05:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exp_data_OpeningFcn, ...
                   'gui_OutputFcn',  @Exp_data_OutputFcn, ...
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


% --- Executes just before Exp_data is made visible.
function Exp_data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exp_data (see VARARGIN)
handles.flag_firstrun = 1;
handles.flag_notch = 0;
handles.flag_movie = 0; 
handles.flag_figures = 1;
handles.colormapgreyscale = importdata('colortable_greyscale.txt');
handles.colormapgreyscale = handles.colormapgreyscale /255;
handles.colormapjet = importdata('colortable_jet.txt');
handles.colormapjet = handles.colormapjet /255;

handles.image_no = 0;
handles.j1 = 1;
handles.j2 = 1;
handles.ky = 305.5;  handles.kx = 0.1;

handles.holo = imread('holo_cheek1.png');
handles.holo_fft = fftshift(fft2(handles.holo)); handles.holo_fft_max = max(max(abs(handles.holo_fft)));
handles.holo_fft0 = handles.holo_fft;
if(handles.flag_figures)
axes(handles.image_axis1); imagesc(abs(handles.holo_fft)); caxis( [ 0 handles.holo_fft_max/1000] ); colormap 'jet';
end

handles.filter_width_x = 1/1; handles.filter_width_y = 1/12;



handles.temp = size( handles.holo ); handles.Ny = handles.temp(1); handles.Nx = handles.temp(2);
 %create window function
 if(handles.flag_firstrun)
 handles.N = handles.Nx;
 handles.crop_x_width = handles.Nx*handles.filter_width_x/1.0;
 handles.crop_y_width = handles.Ny*handles.filter_width_y/1.0; %should be N/4, but a slightly lower value is better
        handles.jpk_window(1:handles.Ny,1:handles.Nx) = 0;
        handles.jpk_window2(1:handles.Ny,1:handles.Nx) = 0;
        handles.crop_x_center = handles.Nx/2+handles.kx+1;
        handles.crop_y_center = handles.Ny/2+(handles.ky+1);
        for yQ=1:handles.Ny
        for xQ=1:handles.Nx
            %wvalue = exp( -(yQ-crop_y_center)^2/(crop_y_width^2/2)) * exp( -(xQ-crop_x_center)^2/(crop_x_width^2/2));
            if abs(yQ-handles.crop_y_center) < handles.crop_y_width 
            if abs(xQ-handles.crop_x_center) < handles.crop_x_width 
            handles.wvalue = 0.4 + 0.6 * cos( (yQ-handles.crop_y_center) / handles.crop_y_width * pi*0.6 ) ;
            handles.wvalue = handles.wvalue * ( 0.4 + 0.6 * cos( (xQ-handles.crop_x_center) / handles.crop_x_width * pi*0.6 ) );
            handles.jpk_window(yQ,xQ) = handles.wvalue; 
            end
            end
        end
        end
        handles.crop_x_center = handles.Nx/2+handles.kx+1;
        handles.crop_y_center = handles.Ny/2+(handles.ky*2+1);
        for yQ=1:handles.Ny
        for xQ=1:handles.Nx
            %wvalue = exp( -(yQ-crop_y_center)^2/(crop_y_width^2/2)) * exp( -(xQ-crop_x_center)^2/(crop_x_width^2/2));
            if abs(yQ-handles.crop_y_center) < handles.crop_y_width 
            if abs(xQ-handles.crop_x_center) < handles.crop_x_width 
            handles.wvalue = 0.4 + 0.6 * cos( (yQ-handles.crop_y_center) / handles.crop_y_width * pi*0.6 ) ;
            handles.wvalue = handles.wvalue * ( 0.4 + 0.6 * cos( (xQ-handles.crop_x_center) / handles.crop_x_width * pi*0.6 ) );
            handles.jpk_window2(yQ,xQ) = handles.wvalue; 
            end
            end
        end
        end
 end

 handles.holo_fft1 = handles.holo_fft .* handles.jpk_window;
 handles.holo_fft2 = handles.holo_fft .* handles.jpk_window2;
 
 handles.holo_reco1 = ifft2( fftshift(handles.holo_fft1) );
 handles.holo_reco2 = ifft2( fftshift(handles.holo_fft2) );
 
 if(handles.flag_firstrun)
  handles.jpk_phase_correction1(1:handles.Ny,1:handles.Nx) = 0;
 handles.jpk_phase_correction2(1:handles.Ny,1:handles.Nx) = 0;
 for yQ=1:handles.Ny
 for xQ=1:handles.Nx
     handles.wvalue = exp( -2*pi*1i*yQ/handles.Ny*handles.ky ) * exp( -2*pi*1i*xQ/handles.Nx*handles.kx ) ;
     handles.jpk_phase_correction1(yQ,xQ) = handles.wvalue; 
     handles.wvalue = exp( -2*pi*1i*yQ/handles.Ny*(handles.ky*2) ) * exp( -2*pi*1i*xQ/handles.Nx*handles.kx ) ;
     handles.jpk_phase_correction2(yQ,xQ) = handles.wvalue; 
 end
 end
 end
 handles.holo_reco1 = handles.holo_reco1 .* handles.jpk_phase_correction1;
 handles.holo_reco2 = handles.holo_reco2 .* handles.jpk_phase_correction2;
% holo_reco1 = holo_reco1 .* exp(-1i * angle(holo_reco1(1,1)));
% holo_reco2 = holo_reco2 .* exp(-1i * angle(holo_reco2(1,1)));
 handles.holophase = handles.holo_reco1 ./ abs(handles.holo_reco1);
 handles.phaseavg = sum(sum(handles.holophase)) / handles.Nx / handles.Ny;
 %phase_offset = angle(qavg);
 handles.phase_offset = 0;
 handles.holo_reco1 = handles.holo_reco1 .* exp(-1i * handles.phase_offset);
 handles.holo_reco2 = handles.holo_reco2 .* exp(-1i * 2*handles.phase_offset);

 [handles.histcnt,handles.histbin] = histcounts( angle(handles.holo_reco1(:)), 100);
 [handles.histmax,handles.histmaxind] = max(handles.histcnt);
 handles.histmaxpos = handles.histbin(handles.histmaxind);
 handles.phase_offset = handles.histmaxpos;
 handles.holo_reco1 = handles.holo_reco1 .* exp(-1i * handles.phase_offset);
 handles.holo_reco2 = handles.holo_reco2 .* exp(-1i * 2*handles.phase_offset);

 
 %holo_reco2 = holo_reco2 * 600/260;
 
 handles.hmax = max( max(max(abs(handles.holo_reco1))), max(max(abs(handles.holo_reco2)))); 
  axes(handles.image_axis2); hist( angle(handles.holo_reco1(:)), 100);
%  if(handles.flag_figures)
%  subplot(2,4,1,'Parent', handles.image_axis2); imagesc( abs(handles.holo_reco1) ); caxis([ 0 handles.hmax] );
%  subplot(2,4,2,'Parent', handles.image_axis2); imagesc( angle(handles.holo_reco1) ); caxis([ -3.14 3.14]);
%  subplot(2,4,3,'Parent', handles.image_axis2); hist( angle(handles.holo_reco1(:)), 100);
%  subplot(2,4,5,'Parent', handles.image_axis2); imagesc( abs(handles.holo_reco2) ); caxis([ 0 handles.hmax] );
%  subplot(2,4,6,'Parent', handles.image_axis2); imagesc( angle(handles.holo_reco2) ); caxis([ -3.14 3.14]);
%  subplot(2,4,7,'Parent', handles.image_axis2); hist( angle(handles.holo_reco2(:)), 100);
%  end
 
 
 %break
 % treshold phase
%  if(1)
%  handles.tmp = handles.holo_reco1; handles.qpos = abs(angle(handles.holo_reco1)) < pi/2; handles.qneg = abs(angle(handles.holo_reco1)) >= pi/2; handles.tmp(handles.qpos) = 1; handles.tmp(handles.qneg) = -1; handles.holo_reco1 = abs(handles.holo_reco1) .* handles.tmp;
%  handles.tmp = handles.holo_reco2; handles.qpos = abs(angle(handles.holo_reco2)) < pi/2; handles.qneg = abs(angle(handles.holo_reco2)) >= pi/2; handles.tmp(handles.qpos) = 1; handles.tmp(handles.qneg) = -1; handles.holo_reco2 = abs(handles.holo_reco2) .* handles.tmp;
%  if(handles.flag_figures)
%  subplot(2,4,4,'Parent', handles.image_axis2); imagesc( angle(handles.holo_reco1) ); caxis([ -3.14 3.14]);
%  subplot(2,4,8,'Parent', handles.image_axis2); imagesc( angle(handles.holo_reco2) ); caxis([ -3.14 3.14]);
%  end
%  end
 %figure(4); qx = 200; q1 = holo_reco1(:,qx); q2 = holo_reco2(:,qx); ty = linspace(1,Ny,Ny);plot( ty, [abs(q1),abs(q2)]); 


 
 
 %holo_reco = real(holo_reco1) + 1i * real(holo_reco2);
 %holo_reco = 110*(holo_reco1) + 90* 1i* (holo_reco2);
 %holo_reco = 110*abs(holo_reco1) + 88* 1i* abs(holo_reco2);
 %holo_reco = 110*real(holo_reco1) + 88* 1i* real(holo_reco2);
 handles.holo_reco = handles.j1*real(handles.holo_reco1) + handles.j2*1i* real(handles.holo_reco2);
 
  handles.holo_reco_max = max(max(abs(handles.holo_reco)));
 %figure(4); subplot(2,1,1); imagesc( abs(holo_reco) ); caxis([ 0 holo_reco_max]); subplot(2,1,2); imagesc( angle(holo_reco) ); caxis([ -3.14 3.14]);
 axes(handles.image_axis3); imagesc( abs(handles.holo_reco) ); caxis([ 0 handles.holo_reco_max]); colormap 'gray';
 axes(handles.image_axis4); imagesc( angle(handles.holo_reco) ); caxis([ -3.14 3.14]); colormap 'gray';
 
 
 

% Choose default command line output for Schnell_Optics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Exp_data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function kx_Callback(hObject, eventdata, handles)
% hObject    handle to kx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kx as text
%        str2double(get(hObject,'String')) returns contents of kx as a double
handles.kx=get(hObject,'Value');
runcode(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function kx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ky_Callback(hObject, eventdata, handles)
% hObject    handle to ky (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ky as text
%        str2double(get(hObject,'String')) returns contents of ky as a double
handles.ky=get(hObject,'Value');
runcode(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ky_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ky (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j1_Callback(hObject, eventdata, handles)
% hObject    handle to j1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j1 as text
%        str2double(get(hObject,'String')) returns contents of j1 as a double
handles.j1=get(hObject,'Value');
runcode(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function j1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j2_Callback(hObject, eventdata, handles)
% hObject    handle to j2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j2 as text
%        str2double(get(hObject,'String')) returns contents of j2 as a double
handles.j2=get(hObject,'Value');
runcode(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function j2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
