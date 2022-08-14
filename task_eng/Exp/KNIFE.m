function varargout = KNIFE(varargin)
% KNIFE MATLAB code for KNIFE.fig
%      KNIFE, by itself, creates a new KNIFE or raises the existing
%      singleton*.
%
%      H = KNIFE returns the handle to a new KNIFE or the handle to
%      the existing singleton*.
%
%      KNIFE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KNIFE.M with the given input arguments.
%
%      KNIFE('Property','Value',...) creates a new KNIFE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KNIFE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KNIFE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KNIFE

% Last Modified by GUIDE v2.5 06-Mar-2021 13:37:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KNIFE_OpeningFcn, ...
                   'gui_OutputFcn',  @KNIFE_OutputFcn, ...
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


% --- Executes just before KNIFE is made visible.
function KNIFE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KNIFE (see VARARGIN)
global b_k counts met num all_result
load knife
load(strcat('result',num2str(num)))
counts = 0;
a = rand(12,12);
a = tril(a);
i = 1;
for m = 1:12
    for n = 1:12
        if a(m,n) == 0
            i = i;
        else
            b_k(i,1) = a(m,n);
            b_k(i,2) = m;
            b_k(i,3) = n;
            i = i+1;
        end
    end
end
b_k = sortrows(b_k,1);
for o = 1:size(b_k,1)/2
    b_k(o,[2 3]) = b_k(o,[3 2]);
end
% Choose default command line output for KNIFE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KNIFE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KNIFE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counts b_k res_k
t=get(handles.slider1,'value');
diff = round(abs(t)*100);
set(handles.text11,'String',diff)
if counts > 0 && counts <= size(b_k,1)
res_k(b_k(counts,2),b_k(counts,3)) = -t;
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counts b_k met s res_k all_result num saveroot
counts = counts+1;
if counts <= size(b_k,1)
    l = met(b_k(counts,2),1);
    r = met(b_k(counts,3),1);
    set(handles.text5,'String',l);
    set(handles.text6,'String',r);
    set(handles.pushbutton1,'String','ÏÂÒ»¸ö')
    set(handles.slider1,'value',0);
    set(handles.text11,'String',0);
else
    close KNIFE
    ques_k
    all_result.res_k = res_k;
    save (strcat(saveroot,strcat('result',num2str(num))),'all_result')
end
