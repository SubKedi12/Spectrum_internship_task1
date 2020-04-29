function varargout = BMICalculator(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BMICalculator_OpeningFcn, ...
                   'gui_OutputFcn',  @BMICalculator_OutputFcn, ...
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


function BMICalculator_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);



function varargout = BMICalculator_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


function inchmet_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inchmet_Callback(hObject, eventdata, handles)
incmet = str2double(get(hObject, 'String'));
if isnan(incmet)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.incmet = incmet;
guidata(hObject,handles)


function kglb_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kglb_Callback(hObject, eventdata, handles)
weight = str2double(get(hObject, 'String'));
if isnan(weight)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.weight= weight;
guidata(hObject,handles)

function unitgroup_CreateFcn(hObject, eventdata, handles)

function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
global m;
m=1;
if (hObject == handles.imperial)
    set(handles.stlbkg, 'String', 'lb');
    set(handles.stinm, 'String', 'in');
    set(handles.stfeet, 'Visible','on');
    set(handles.feet,'Visible','on');
else
    set(handles.stlbkg, 'String', 'kg');
    set(handles.stinm, 'String', 'm');
    set(handles.stfeet, 'Visible','off');
    set(handles.feet,'Visible','off');
    m=0;
end



function name_Callback(hObject, eventdata, handles)
global usname;
usname=get(hObject,'String');



function name_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function feet_Callback(hObject, eventdata, handles)
fet=str2double(get(hObject,'String'));
if isnan(fet)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.fet=fet;
guidata(hObject,handles)



function feet_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calculate_Callback(hObject, eventdata, handles)
global bmi;
global m;
if(m==1)
    heightt=((handles.metricdata.fet)*12)+(handles.metricdata.incmet);
    bmi= 702*(handles.metricdata.weight / (heightt^2));
elseif(m==0)
    heightt=handles.metricdata.incmet;
    bmi= (handles.metricdata.weight / (heightt^2));
end
Condition


function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.name, 'String', 'Name');
set(handles.inchmet, 'String', 0);
set(handles.feet, 'String', 0);
set(handles.kglb, 'String', 0);
set(handles.kglb, 'Visible','on');
set(handles.feet,'Visible','on');
