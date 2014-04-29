% normalizacja wynik�w zepsutych ludzi; 
% biokreatywni: badania AGK
% D.P. ver.1 18.03.14
clc, close all, clear all;
% wczytanie z *.xlsx; 

% wczytuje nazwy plik�w
A = dir(['dane_lewa' '\' '*.xlsx']);
cd('dane_lewa')
for i=1:length(A)
% do zmiennej dane wczytuje plik z danymi
dane = xlsread(A(i).name);
[wiersze, kolumny] = size(dane);

for j=1:wiersze
dane(j,13) = (j/wiersze)*100;
end

% kolumna D (4) to k�ty, kolumna L(12) to czas w %
czas = dane(:,13);
katy = dane(:,8);

% interpolka sklejanymi
yy = spline(czas, katy);
% tworzenie wektora czasu: 
xx = linspace(czas(1,1),czas(wiersze,1), 1500);
% wyswietlam na pierwszym subplocie
% figure(1)
% plot(xx,ppval(yy,xx))
% hold on
% przeliczone dane do wektor�w: X to czas znormalizowany; Y to k�ty po
% interpolacji
X(:,i) = xx;
Y(:,i) = ppval(yy,xx);
end
% ustalanie zakres�w minimum, maximum, �rednia
for i =1:1500
    zbiorczo(i,1) = min(Y(i,:));    % minimum
    zbiorczo(i,2) = max(Y(i,:));    % maksimum
    zbiorczo(i,3) = mean(Y(i,:));   % �rednia
end
% plotowanie zakresow jako linie
% plot(xx, zbiorczo(:,1),'b-',xx,zbiorczo(:,2),'b-',xx,zbiorczo(:,3), 'r-')

fill( [xx fliplr(xx)],  [zbiorczo(:,2)' fliplr(zbiorczo(:,1)')], 'k');
alpha(.25); hold on
plot(xx,zbiorczo(:,3) , 'k', 'LineWidth', 2)
plot(xx, zbiorczo(:,2), 'k')
plot(xx, zbiorczo(:,1), 'k')
xlabel('czas [%]')
ylabel('k�t [stopnie]')
