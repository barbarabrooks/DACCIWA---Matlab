%% Import data from text file.
% Script for importing data from the following text file:
%
%    G:\renfrew\ship\data\gga_df_1s.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/06/22 10:17:27

%% Initialize variables.
filename = 'G:\renfrew\ship\data\gga_df_1s.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
VarName2 = dataArray{:, 1};
lat = dataArray{:, 2};
lon = dataArray{:, 3};
time = dataArray{:, 4};

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;