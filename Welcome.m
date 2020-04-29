function varargout = Welcome(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Welcome_OpeningFcn, ...
                   'gui_OutputFcn',  @Welcome_OutputFcn, ...
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


function Welcome_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);


function varargout = Welcome_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function name_Callback(hObject, eventdata, handles)
global usname;
usname=get(hObject,'String');
if isempty(usname)
    errordlg('Please enter  valid name');
end
handles.metricdata.usname=usname;
guidata(hObject,handles)


function name_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function gobutton_Callback(hObject, eventdata, handles)
title='In what system would you like your BMI to be calculated?';
global k;
k=menu(title,'Imperial System', 'SI System');
if k==0
    close all;
else
    Measurements
end
