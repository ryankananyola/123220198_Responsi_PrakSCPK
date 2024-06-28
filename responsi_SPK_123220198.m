function varargout = responsi_SPK_123220198(varargin)
% RESPONSI_SPK_123220198 MATLAB code for responsi_SPK_123220198.fig
%      RESPONSI_SPK_123220198, by itself, creates a new RESPONSI_SPK_123220198 or raises the existing
%      singleton*.
%
%      H = RESPONSI_SPK_123220198 returns the handle to a new RESPONSI_SPK_123220198 or the handle to
%      the existing singleton*.
%
%      RESPONSI_SPK_123220198('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSI_SPK_123220198.M with the given input arguments.
%
%      RESPONSI_SPK_123220198('Property','Value',...) creates a new RESPONSI_SPK_123220198 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before responsi_SPK_123220198_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to responsi_SPK_123220198_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help responsi_SPK_123220198

% Last Modified by GUIDE v2.5 21-May-2024 18:32:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @responsi_SPK_123220198_OpeningFcn, ...
                   'gui_OutputFcn',  @responsi_SPK_123220198_OutputFcn, ...
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


% --- Executes just before responsi_SPK_123220198 is made visible.
function responsi_SPK_123220198_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to responsi_SPK_123220198 (see VARARGIN)

% Choose default command line output for responsi_SPK_123220198
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes responsi_SPK_123220198 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = responsi_SPK_123220198_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in showData_198.
function showData_198_Callback(hObject, eventdata, handles)
% hObject    handle to showData_198 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('PlayerFIFA.csv');
opts.SelectedVariableNames = (1:10);
data = readtable('PlayerFIFA.csv', opts);
data = table2cell(data);
data = data(:,1:10);
set(handles.tabelAwal_198, 'Data', data);

% --- Executes on button press in proses_198.
function proses_198_Callback(hObject, eventdata, handles)
% hObject    handle to proses_198 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('PlayerFIFA.csv');
opts.SelectedVariableNames = (1:10);
data = readtable('PlayerFIFA.csv', opts);
data = table2cell(data);
data = data(:,1:10);
set(handles.tabelAwal_198, 'Data', data);

%analisis bobot
bobot = [0.30 0.30 0.20 0.20];
k = [1,1,1,1];
dataTable = get(handles.tabelAwal_198, 'Data');

%normalisasi bobot
[m, n] = size(dataTable);
R = zeros(m, n);
skor = zeros(m, 1);
for j = 1 : n
    if k(j)==1
        R(:,j)=dataTable(:,j)./max(dataTable(:,j);
    else
        R(:,j)=min(dataTable(:,j))./dataTable(:,j);
    end
end

% Perhitungan skor
for i = 1:m
    skor(i) = sum(bobot .* R(i, :));
end

% Menetapkan hasil ke tabel
data = readtable('PlayerFIFA.csv');
data = data(:, 2);
data = table2cell(data);
data = [num2cell(skor), data];
data = sortrows(data, 1, 'descend');
set(handles.tabelHasil_198, 'Data', data);
