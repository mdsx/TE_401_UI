function varargout = ZZGui(varargin)
% ZZGui MATLAB code for ZZGui.fig
%      ZZGui, by itself, creates a new ZZGui or raises the existing
%      singleton*.
%
%      H = ZZGui returns the handle to a new ZZGui or the handle to
%      the existing singleton*.
%
%      ZZGui('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZZGui.M with the given input arguments.
%
%      ZZGui('Property','Value',...) creates a new ZZGui or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ZZGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ZZGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ZZGui

% Last Modified by GUIDE v2.5 08-Mar-2017 22:03:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ZZGui_OpeningFcn, ...
                   'gui_OutputFcn',  @ZZGui_OutputFcn, ...
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


% --- Executes just before ZZGui is made visible.
function ZZGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ZZGui (see VARARGIN)

% Choose default command line output for ZZGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ZZGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ZZGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function brightSlide_Callback(hObject, eventdata, handles)
% hObject    handle to brightSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global im2
val=0.5*get(hObject, 'Value') - 0.5;
imbright = im2 + val;
axes(handles.axes1);
imshow(imbright);

% --- Executes during object creation, after setting all properties.
function brightSlide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
[path, user_cance] = imgetfile();
if user_cance
    msgbox(sprintf('Error'), 'Error', 'Error');
    return;
end
im=imread(path); % imread vs imshow
im=im2double(im);
im2=im;
image(im2);