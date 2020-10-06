function varargout = Covid19_Tracker(varargin)
% COVID19_TRACKER MATLAB code for Covid19_Tracker.fig
%      COVID19_TRACKER, by itself, creates a new COVID19_TRACKER or raises the existing
%      singleton*.
%
%      H = COVID19_TRACKER returns the handle to a new COVID19_TRACKER or the handle to
%      the existing singleton*.
%
%      COVID19_TRACKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COVID19_TRACKER.M with the given input arguments.
%
%      COVID19_TRACKER('Property','Value',...) creates a new COVID19_TRACKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Covid19_Tracker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Covid19_Tracker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Covid19_Tracker

% Last Modified by GUIDE v2.5 08-May-2020 18:19:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Covid19_Tracker_OpeningFcn, ...
                   'gui_OutputFcn',  @Covid19_Tracker_OutputFcn, ...
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


% --- Executes just before Covid19_Tracker is made visible.
function Covid19_Tracker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Covid19_Tracker (see VARARGIN)

% Choose default command line output for Covid19_Tracker
handles.output = hObject;
myImage = imread('bcgnd.png');
axes(handles.axes);
imshow(myImage);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Covid19_Tracker wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Covid19_Tracker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%  NOW LETS METION THE CONDITIONS AND INITIALISATION OF VARIABLES BY IMPORT
%  FUNCTION --BY SOBHIT PANDA 
if (get(handles.menu,'Value') == 2)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A6361:F6487";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        dindia = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts
        set(handles.confirm,'String',dindia.total_cases(127));
        set(handles.deathtoll,'String',dindia.total_deaths(127));
        setappdata(0,'data',dindia);
elseif (get(handles.menu,'Value') == 3)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A14644:F14771";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        dusa = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts  
        set(handles.confirm,'String',dusa.total_cases(127));
        set(handles.deathtoll,'String',dusa.total_deaths(127));
        setappdata(0,'data',dusa);
elseif (get(handles.menu,'Value') == 4)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A2934:F3061";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        dchina = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts 
        set(handles.confirm,'String',dchina.total_cases(127));
        set(handles.deathtoll,'String',dchina.total_deaths(127));
        setappdata(0,'data',dchina);  
elseif (get(handles.menu,'Value') == 5)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A7225:F7352";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        ditaly = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts  
        set(handles.confirm,'String',ditaly.total_cases(127));
        set(handles.deathtoll,'String',ditaly.total_deaths(127));
        setappdata(0,'data',ditaly);   
elseif (get(handles.menu,'Value') == 6)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A12818:F12945";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        dskorea = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts 
        set(handles.confirm,'String',dskorea.total_cases(127));
        set(handles.deathtoll,'String',dskorea.total_deaths(127));
        setappdata(0,'data',dskorea);  
 elseif (get(handles.menu,'Value') == 1)
        set(handles.warning,'String','*You have not Chosen any Country');
        set(handles.confirm,'String',"Click Option");
        set(handles.deathtoll,'String',"Click Option");
        myImage = imread('bcgnd.png');
        axes(handles.axes);
        imshow(myImage);
end       
  
     


% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu


% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in confirmed.
function confirmed_Callback(hObject, eventdata, handles)
% hObject    handle to confirmed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'data');
if (get(handles.menu,'Value') == 1)
    set(handles.warning,'String','*You have not Chosen any Country');
else    
    plot(handles.axes,data.date,data.total_cases);
end


% --- Executes on button press in deceased.
function deceased_Callback(hObject, eventdata, handles)
% hObject    handle to deceased (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'data');
if (get(handles.menu,'Value') == 1)
    set(handles.warning,'String','*You have not Chosen any Country');
else    
    plot(handles.axes,data.date,data.total_deaths);
end




% --- Executes on button press in both.
function both_Callback(hObject, eventdata, handles)
% hObject    handle to both (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'data');
if (get(handles.menu,'Value') == 1)
    set(handles.warning,'String','*You have not Chosen any Country');
else    
    figure;
    subplot (2,1,1) ; plot(data.date,data.total_cases);
    xlabel({'Above Gragh Shows Total Cases Till Now',''},'FontWeight','bold',...
            'FontName','Adobe Arabic',...
            'Color',[0.490196078431373 0.180392156862745 0.56078431372549]);
    subplot (2,1,2) ; plot(data.date,data.total_deaths);
    xlabel({'Above Graph Shows Total Deaths So Far',''},'FontWeight','bold',...
            'FontSize',9.9,...
            'FontName','Adobe Arabic',...
            'Color',[0.490196078431373 0.180392156862745 0.56078431372549]);

end







function confirm_Callback(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of confirm as text
%        str2double(get(hObject,'String')) returns contents of confirm as a double


% --- Executes during object creation, after setting all properties.
function confirm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function death_Callback(hObject, eventdata, handles)
% hObject    handle to death (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of death as text
%        str2double(get(hObject,'String')) returns contents of death as a double


% --- Executes during object creation, after setting all properties.
function death_CreateFcn(hObject, eventdata, handles)
% hObject    handle to death (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: place code in OpeningFcn to populate axes
