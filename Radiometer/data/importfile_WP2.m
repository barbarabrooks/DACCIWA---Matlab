%% Import data from text file.
% Script for importing data from the following text file:
%
%    G:\renfrew\ship\data\WP2_Leg2_v2.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/06/22 09:42:50

%% Initialize variables.
filename = 'G:\renfrew\ship\data\WP2_Leg2_v2.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: text (%s)
%   column3: text (%s)
%	column4: text (%s)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: text (%s)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%s%s%s%f%f%f%f%f%f%f%f%f%f%f%s%f%f%f%s%[^\n\r]';

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
VarName1 = dataArray{:, 1};
UnitID = dataArray{:, 2};
Date1 = dataArray{:, 3};
Time = dataArray{:, 4};
Relwindspeedms = dataArray{:, 5};
Relwinddirreftoshipbow = dataArray{:, 6};
Sigmatheta = dataArray{:, 7};
AirTC = dataArray{:, 8};
VBATVdc = dataArray{:, 9};
RH = dataArray{:, 10};
Windgustms = dataArray{:, 11};
SolarWm2 = dataArray{:, 12};
BIT = dataArray{:, 13};
Truewindspms = dataArray{:, 14};
TrueWDirReferredtoN = dataArray{:, 15};
Shipposition = dataArray{:, 16};
Shipvelocityms = dataArray{:, 17};
Gyro = dataArray{:, 18};
CMG = dataArray{:, 19};
datetime = dataArray{:, 20};

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;