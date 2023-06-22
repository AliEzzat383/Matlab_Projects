function varargout = Game_window(varargin)
% GAME_WINDOW MATLAB code for Game_window.fig
%      GAME_WINDOW, by itself, creates a new GAME_WINDOW or raises the existing
%      singleton*.
%
%      H = GAME_WINDOW returns the handle to a new GAME_WINDOW or the handle to
%      the existing singleton*.
%
%      GAME_WINDOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME_WINDOW.M with the given input arguments.
%
%      GAME_WINDOW('Property','Value',...) creates a new GAME_WINDOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Game_window_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Game_window_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Game_window

% Last Modified by GUIDE v2.5 27-Aug-2022 15:45:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Game_window_OpeningFcn, ...
                   'gui_OutputFcn',  @Game_window_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});

% End initialization code - DO NOT EDIT

end
% --- Executes just before Game_window is made visible.
function Game_window_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Game_window (see VARARGIN)

% Choose default command line output for Game_window
handles.output = hObject;
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Game_window wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = Game_window_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
    
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loc_x=[70,70,70,70,70,70,70,70,70];
loc_y=[60,61,62,63,64,65,66,67,68];
global mat_r mat_g mat_b;
mat_r = zeros(100,100);
mat_g = zeros(100,100);
mat_b = zeros(100,100);
update_snake(loc_x,loc_y)
imshow(cat(3,mat_r,mat_g,mat_b));
    while(1)
        imshow(cat(3,mat_r,mat_g,mat_b));
        pause(0.1);
            for j=1:len(loc_x)
                mat_r(loc_x(j),loc_y(j))=0;
                mat_g(loc_x(j),loc_y(j))=0;
                mat_b(loc_x(j),loc_y(j))=0;
            end
        loc_x(2:len(loc_x))=loc_x(1:len(loc_x)-1);
        loc_y(2:len(loc_y))=loc_y(1:len(loc_y)-1);
    end
end

function update_snake(loc_x,loc_y)
    global mat_r mat_g mat_b;
    mat_r(loc_x(1),loc_y(1))=0;
    mat_g(loc_x(1),loc_y(1))=0;
    mat_b(loc_x(1),loc_y(1))=225;

    for i=2:length(loc_x)
        mat_r(loc_x(i),loc_y(i))=0;
        mat_g(loc_x(i),loc_y(i))=225;
        mat_b(loc_x(i),loc_y(i))=0;
    end
end

% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
% hObject    handle to up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
end

% --- Executes on button press in toggle.
function toggle_Callback(hObject, eventdata, handles)
% hObject    handle to toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
end

% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
end

% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
end

% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
% hObject    handle to down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
end

% --- Executes on button press in tag.
function tag_Callback(hObject, eventdata, handles)
% hObject    handle to tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_g mat_b;
end
