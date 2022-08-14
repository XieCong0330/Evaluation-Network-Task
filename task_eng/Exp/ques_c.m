function varargout = ques_c(varargin)
%QUES_C M-file for ques_c.fig
%      QUES_C, by itself, creates a new QUES_C or raises the existing
%      singleton*.
%
%      H = QUES_C returns the handle to a new QUES_C or the handle to
%      the existing singleton*.
%
%      QUES_C('Property','Value',...) creates a new QUES_C using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to ques_c_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      QUES_C('CALLBACK') and QUES_C('CALLBACK',hObject,...) call the
%      local function named CALLBACK in QUES_C.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ques_c

% Last Modified by GUIDE v2.5 03-Apr-2021 15:52:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ques_c_OpeningFcn, ...
                   'gui_OutputFcn',  @ques_c_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before ques_c is made visible.
function ques_c_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
global counts Q selection
load Q
counts = 1;
set(handles.text11,'String',Q(counts,1))
selection = ones(size(Q,1),1)*0;
% Choose default command line output for ques_c
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ques_c wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ques_c_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',1);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',1);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',1);
set(handles.radiobutton5,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',1);
% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counts selection all_result s Q num saveroot
if get(handles.radiobutton1,'value')==1
    selection(counts,1) = 1;
elseif get(handles.radiobutton2,'value')==1
    selection(counts,1) = 2;
elseif get(handles.radiobutton3,'value')==1
    selection(counts,1) = 3;
elseif get(handles.radiobutton4,'value')==1
    selection(counts,1) = 4;
elseif get(handles.radiobutton5,'value')==1
    selection(counts,1) = 5;
end
if selection(counts,1) == 0
    warndlg('Please make your choice', 'Note')
else
counts = counts+1;
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
if counts <= size(Q,1)
    set(handles.text11,'String',Q(counts,1))
else
    close
    if s(1,1) == 2
        if s(2,1) == 1
            load knife
            rawrank = randperm(size(met,1));
            met = met(rawrank,:);
            Answerlist = strjoin(met,',');
            hint = 'Answers to be evaluated include:';
            all_msg = strjoin({hint,Answerlist});
            KNIFE
            msgbox(all_msg,'List')
        else
            load newspaper
            rawrank = randperm(size(met,1));
            met = met(rawrank,:);
            Answerlist = strjoin(met,',');
            hint = 'Answers to be evaluated include:';
            all_msg = strjoin({hint,Answerlist});
            NEWSPAPPER
            msgbox(all_msg,'List')
        end
    all_result.state1 = selection;
    save (strcat(saveroot,strcat('result',num2str(num))),'all_result')
    elseif s(2,1) == 2
        if s(3,1) == 1
            load knife
            rawrank = randperm(size(met,1));
            met = met(rawrank,:);
            Answerlist = strjoin(met,',');
            hint = 'Answers to be evaluated include:';
            all_msg = strjoin({hint,Answerlist});
            KNIFE
            msgbox(all_msg,'List')
        else
            load newspaper
            rawrank = randperm(size(met,1));
            met = met(rawrank,:);
            Answerlist = strjoin(met,',');
            hint = 'Answers to be evaluated include:';
            all_msg = strjoin({hint,Answerlist});
            NEWSPAPPER
            msgbox(all_msg,'List')
        end
    all_result.state2 = selection;
    save (strcat(saveroot,strcat('result',num2str(num))),'all_result')
    else
        warndlg('The experiment was over, thank you for your participation!', 'Note')
    all_result.state3 = selection;
    save (strcat(saveroot,strcat('result',num2str(num))),'all_result')
    end
end
end
