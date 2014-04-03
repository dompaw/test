% normalizacja wynik�w zepsutych ludzi; 
% biokreatywni: badania AGK
% D.P. ver.1 18.03.14
clc, close all, clear all;
% wczytanie z *.xlsx; UWAGA: nie ma wektora czasowego
dane = xlsread('dane/Zalewski030.xlsx');

[wiersze, kolumny] = size(dane);

% to co tu jest to chyba sie nie przyda - Piecko odwali�a kawa� dobrej
% roboty z plikami (dn. 4.04.14)

% % przetwarzanie calego pliku
% for j = 1 : 1 : kolumny
%     A = dane(isfinite(dane(:, j)), j);         % wywal NaNy
%     
%     for i = 1 : 1 : length(A)
%         X(i,(2*j)-1) = i / length(A);           % wetor pomocniczy jako skala x
%         X(i,2*j) = A(i,1);                             % wektor wartosci k�ta
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

% kolumna D (4) to k�ty, kolumna L(12) to czas w %

katy = dane(:,4);
czas = dane(:,12);

% interpolka sklejanymi
yy = spline(czas, katy);
% tworzenie wektora czasu: 
% UWAGA: 10220 pr�bek! �eby nie by�o w�tpliwo�ci ze co� plotem przyblizamy!
xx = linspace(czas(1,1),czas(511,1), length(czas)*20);
% wyswietlam na pierwszym subplocie
subplot(211),plot(xx,ppval(yy,xx), '.')

% sprawdzanko: wyswietlam na drugim rysunku
subplot(212), plot(czas,katy, '.')

