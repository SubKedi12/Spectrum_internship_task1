function varargout = Measurements(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Measurements_OpeningFcn, ...
                   'gui_OutputFcn',  @Measurements_OutputFcn, ...
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


function Measurements_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global k;
if (k==1)
    set(handles.text4, 'String', 'ft');
    set(handles.inch, 'String', 'in');
    set(handles.text8, 'String', 'lb');
else
    set(handles.feet, 'enable', 'off');
    set(handles.text4, 'enable', 'off');
    set(handles.inch, 'String', 'm');
    set(handles.text8, 'String', 'kg');
    
end


function varargout = Measurements_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function feet_Callback(hObject, eventdata, handles)
heightin = str2double(get(hObject, 'String'));
if isnan(heightin)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.heightin = heightin;
guidata(hObject,handles)


function feet_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inmet_Callback(hObject, eventdata, handles)
heightm = str2double(get(hObject, 'String'));
if isnan(heightm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.heightm = heightm;
guidata(hObject,handles)


function inmet_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lbkg_Callback(hObject, eventdata, handles)
weight = str2double(get(hObject, 'String'));
if isnan(weight)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.weight = weight;
guidata(hObject,handles)


function lbkg_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function calc_Callback(hObject, eventdata, handles)
global k;
global bmi;
if (k==1)
    x=handles.metricdata.heightin+((handles.metricdata.heightm)*12);
    bmi = (handles.metricdata.weight / (x^2)) * 702;
else
    bmi = handles.metricdata.weight / ((handles.metricdata.heightm)^2);
end
Condition



function text4_DeleteFcn(hObject, eventdata, handles)


function reset_Callback(hObject, eventdata, handles)
handles.metricdata.weight = 0;
handles.metricdata.height  = 0;
set(handles.lbkg, 'String', handles.metricdata.weight);
set(handles.feet,  'String', handles.metricdata.height);
set(handles.inmet,  'String', handles.metricdata.height);
