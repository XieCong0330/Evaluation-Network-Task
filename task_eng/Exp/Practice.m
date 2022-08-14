function varargout = Practice(varargin)
% Practice MATLAB code for Practice.fig
%      Practice, by itself, creates a new Practice or raises the existing
%      singleton*.
%
%      H = Practice returns the handle to a new Practice or the handle to
%      the existing singleton*.
%
%      Practice('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Practice.M with the given input arguments.
%
%      Practice('Property','Value',...) creates a new Practice or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practice_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practice

% Last Modified by GUIDE v2.5 06-Mar-2021 15:48:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practice_OpeningFcn, ...
                   'gui_OutputFcn',  @Practice_OutputFcn, ...
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


% --- Executes just before Practice is made visible.
function Practice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Practice (see VARARGIN)
global b_prac counts met num all_result s
load prac 
load(strcat('result',num2str(num)))
counts = 0;
a = rand(3,3);
a = tril(a);
i = 1;
for m = 1:3
    for n = 1:3
        if a(m,n) == 0
            i = i;
        else
            b_prac(i,1) = a(m,n);
            b_prac(i,2) = m;
            b_prac(i,3) = n;
            i = i+1;
        end
    end
end
b_prac = sortrows(b_prac,1);
s = rand(3,2);
s(:,1) = 1:3;
s = sortrows(s,2);
% Choose default command line output for Practice
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Practice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Practice_OutputFcn(hObject, eventdata, handles) 
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
global counts b_prac res0 
t=get(handles.slider1,'value');
diff = round(abs(t)*100);
set(handles.text10,'String',diff)
if counts > 0 && counts <= size(b_prac,1)
res0(b_prac(counts,2),b_prac(counts,3)) = -t;
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
global counts b_prac met s res0 all_result num diff saveroot
counts = counts+1;
if counts <= size(b_prac,1)
    l = met(b_prac(counts,2),1);
    r = met(b_prac(counts,3),1);
    set(handles.text5,'String',l);
    set(handles.text6,'String',r);
    set(handles.pushbutton1,'String','Next')
    set(handles.slider1,'value',0);
    set(handles.text10,'String',0);
else
    button=questdlg('Finish the exercise and enter the formal experiment?Click Yes to enter the formal experiment, click No to practice again','Exercise End','Yes','No','Yes');
    if strcmp(button,'Yes')
        close
        if s(1,1) == 1
            load knife
            rawrank = randperm(size(met,1));
            met = met(rawrank,:);
            Answerlist = strjoin(met,',');
            hint = 'Answers to be evaluated include:';
            all_msg = strjoin({hint,Answerlist});
            KNIFE
            msgbox(all_msg,'List')
        elseif s(1,1) == 2
            load chopsticks
            rawrank = randperm(size(met,1));
            met = met(rawrank,:);
            Answerlist = strjoin(met,',');
            hint = 'Answers to be evaluated include:';
            all_msg = strjoin({hint,Answerlist});
            CHOPSTICKS
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
        all_result.res0 = res0;
        save (strcat(saveroot,strcat('result',num2str(num))),'all_result')
    else
        counts = 0;
        a = rand(3,3);
        a = tril(a);
        i = 1;
        for m = 1:3
            for n = 1:3
                  if a(m,n) == 0
                      i = i;
                  else
                      b_prac(i,1) = a(m,n);
                      b_prac(i,2) = m;
                      b_prac(i,3) = n;
                      i = i+1;
                  end
            end
        end
       b_prac = sortrows(b_prac,1);
    end
end
