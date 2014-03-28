% normalizacja wyników zepsutych ludzi; 
% biokreatywni: badania AGK
% D.P. ver.1 18.03.14
clc, close all, clear all;
% wczytanie z *.xlsx; UWAGA: nie ma wektora czasowego
dane = xlsread('ADA-ZPB.xls');

[wiersze, kolumny] = size(dane);

% % przetwarzanie calego pliku
% for j = 1 : 1 : kolumny
%     A = dane(isfinite(dane(:, j)), j);         % wywal NaNy
%     
%     for i = 1 : 1 : length(A)
%         X(i,(2*j)-1) = i / length(A);           % wetor pomocniczy jako skala x
%         X(i,2*j) = A(i,1);                             % wektor wartosci k¹ta
%         WART(i,j) = A(i,1);                         % pomocniczy
%     end
% %     [wartosc_min, indeks_min] = min(nonzeros(X(:,(2*j))));
% %     Miny(:,1) = X(indeks_min, 1);
% %     [wartosc_max, indeks_max] = max(nonzeros(X(:,(2*j))));
% %     [wartosc_mean, indeks_mean] = mean(nonzeros(X(:,2*j)));
%     
%     % dawaj wszystko co sensowne, czyli olej zera!
%     plot(nonzeros(X(:,(j*2)-1)), nonzeros(X(:,(j*2))))      
%     
% end


x = 1:749; 
y = dane(1:749,1);
pp = spline(x,y);
yy = ppval(pp, linspace(0,2*pi,101));
plot(yy(1,:),yy(2,:),'-b',y(1,2:5),y(2,2:5),'or'), axis equal