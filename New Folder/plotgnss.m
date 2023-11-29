clc; clear all;
% 기존 파일과 새 파일의 경로
inputFile = 'p23.nmea';
outputFile = 'gnggaonly.txt';

% 새 파일에 $GNGGA로 시작하는 줄 저장
fidInput = fopen(inputFile, 'r');
fidOutput = fopen(outputFile, 'w');

i=1;


while ~feof(fidInput)
    line = fgetl(fidInput);
   
    if startsWith(line, '$GPGGA')
        fprintf(fidOutput, '%s\n', line);
        data{1,i} = split(line, ',');
        lat{i,1}=data{1,i}{3,1};
        lon{i,1}=data{1,i}{5,1};
        i=i+1;
        
    end
end
format long;
% 파일 닫기
fclose(fidInput);
fclose(fidOutput);

lat=cell2mat(lat);
lat=floor(str2num(lat)/100)+(str2num(lat)-(floor(str2num(lat)/100)*100))/60;
lon=cell2mat(lon);
lon=floor(str2num(lon)/100)+(str2num(lon)-(floor(str2num(lon)/100)*100))/60;

% 
% geoplot([lat(1:size(lat))],[lon(1:size(lon))])
% geobasemap streets

h.Marker = ".";
h.Color = "m";

% geoplot([lat(1:size(lat))],[lon(1:size(lon))])
% geobasemap topographic





wm = webmap; % 웹 지도 생성
wmline(wm, lat, lon); % 경로 추가










