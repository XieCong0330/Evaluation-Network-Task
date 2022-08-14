function varargout = CHOPSTICKS(varargin)
% CHOPSTICKS MATLAB code for CHOPSTICKS.fig
%      CHOPSTICKS, by itself, creates a new CHOPSTICKS or raises the existing
%      singleton*.
%
%      H = CHOPSTICKS returns the handle to a new CHOPSTICKS or the handle to
%      the existing singleton*.
%
%      CHOPSTICKS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOPSTICKS.M with the given input arguments.
%
%      CHOPSTICKS('Property','Value',...) creates a new CHOPSTICKS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CHOPSTICKS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CHOPSTICKS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CHOPSTICKS

% Last Modified by GUIDE v2.5 06-Mar-2021 13:37:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CHOPSTICKS_OpeningFcn, ...
                   'gui_OutputFcn',  @CHOPSTICKS_OutputFcn, ...
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


% --- Executes just before CHOPSTICKS is made visible.
function CHOPSTICKS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CHOPSTICKS (see VARARGIN)
global b_c counts met num all_result
load chopsticks
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
            b_c(i,1) = a(m,n);
            b_c(i,2) = m;
            b_c(i,3) = n;
            i = i+1;
        end
    end
end
b_c = sortrows(b_c,1);
for o = 1:size(b_c,1)/2
    b_c(o,[2 3]) = b_c(o,[3 2]);
end
% Choose default command line output for CHOPSTICKS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CHOPSTICKS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CHOPSTICKS_OutputFcn(hObject, eventdata, handles) 
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
global counts b_c res_c
t=get(handles.slider1,'value');
diff = round(abs(t)*100);
set(handles.text10,'String',diff)
if counts > 0 && counts <= size(b_c,1)
res_c(b_c(counts,2),b_c(counts,3)) = -t;
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
global counts b_c met res_c all_result num saveroot
counts = counts+1;
if counts <= size(b_c,1)
    l = met(b_c(counts,2),1);
    r = met(b_c(counts,3),1);
    set(handles.text5,'String',l);
    set(handles.text6,'String',r);
    set(handles.pushbutton1,'String','ÏÂÒ»¸ö')
    set(handles.slider1,'value',0);
    set(handles.text10,'String',0);
else
    close CHOPSTICKS
    ques_c
    all_result.res_c = res_c;
    save (strcat(saveroot,strcat('result',num2str(num))),'all_result')
end
