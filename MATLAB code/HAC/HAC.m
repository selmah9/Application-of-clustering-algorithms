%MATLAB R2020a
clc; clear all; close all;
%hijerarhijski aglomerativni algoritam za grupisanje
%samo prikaz, moguce mijenjati broj klastera rucno

rng('default')%omoguciti ponovljivost

X = rand(200,2); %slucajno generisani uzorci
figure
scatter(X(:,1),X(:,2),30, 'filled');
title('Slučajno generisani uzorci (negrupisani)');

udaljenost=5; %grupise sve primjere u istu grupu koji su medjusobno udaljeni <=udaljenost

%kreiranje stabla hijerarhijskog grupisanja koristenjem odredjenog
%algoritma povezivanja
%metoda: single, complete, ward
%metrika: euklidska udaljednost - default
Z=linkage(X,'ward');

figure
subplot(1,2,1);
H=dendrogram(Z,'ColorThreshold', udaljenost);
sgtitle('Hijerarhijsko aglomerativno grupisanje korištenjem Ward metode povezivanja')
title('Dendrogram')
xlabel('# primjera u origilnalnom skupu X')
ylabel('Udaljenost')
set(H,'LineWidth',3)

%kreiranje klastera na osnovu povezanosti grupa, odn na osnovu stabla
%hijerarhijskog grupisanja koje se dobiva funkcijom linkage
C=cluster(Z,'cutoff', udaljenost,'Criterion','distance');
subplot(1,2,2);
gscatter(X(:,1),X(:,2),C);
title('Grupisani uzorci')


