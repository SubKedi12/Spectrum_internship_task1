function varargout = Condition(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Condition_OpeningFcn, ...
                   'gui_OutputFcn',  @Condition_OutputFcn, ...
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


function varargout = Condition_OutputFcn(hObject, eventdata, handles)

function figure1_CreateFcn(hObject,eventdata,handles)

function text3_CreateFcn(hObject, eventdata, handles)

function text7_CreateFcn(hObject, eventdata, handles)

function text5_CreateFcn(hObject, eventdata, handles)

function Condition_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global usname;
handles.metricdata.d=usname;
set(handles.text5,'String',handles.metricdata.d);

global bmi;
set(handles.text3,'String',bmi);
if bmi<=18.49
    set(handles.text7,'String','Underweight');
elseif bmi>=18.5 && bmi<=24.99
    set(handles.text7,'String','Healthy');
elseif bmi>=25 && bmi<=29.99
    set(handles.text7,'String','Overweight');
else
    set(handles.text7,'String','Obese');
end

function pushbutton1_Callback(hObject, eventdata, handles)
close(handles.figure1);