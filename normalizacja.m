% normalizacja wyników zepsutych ludzi; 
% biokreatywni: badania AGK
% D.P. ver.1 18.03.14
clc, close all, clear all;
% wczytanie z *.xlsx; 

% wczytuje nazwy plików
A = dir(['dane' '\' '*.xlsx']);
cd('dane')
for i=1:length(A)
% do zmiennej dane wczytuje plik z danymi
dane = xlsread(A(i).name);
[wiersze, kolumny] = size(dane);
% kolumna D (4) to k¹ty, kolumna L(12) to czas w %
czas = dane(:,12);
katy = dane(:,4);

% interpolka sklejanymi
yy = spline(czas, katy);
% tworzenie wektora czasu: 
xx = linspace(czas(1,1),czas(wiersze,1), wiersze*5);
% wyswietlam na pierwszym subplocie
figure(1)
plot(xx,ppval(yy,xx), '.')
hold on

end
