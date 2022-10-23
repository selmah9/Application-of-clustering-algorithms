%MATLAB R2020a
clc; clear all; close all;
%hijerarhijski aglomerativni algoritam za grupisanje

%animacija, automatski odabir broja klastera, samo ward
%kod je modifikovan i pruzet sa stranice: https://www.youtube.com/watch?v=XDMb4CudJYk (komentari) 

rng('default')%omoguciti ponovljivost

X = rand(200,2); %slucajno generisani uzorci
figure
scatter(X(:,1),X(:,2),30, 'filled');
title('Slučajno generisani uzorci (negrupisani)');

%kreiranje stabla hijerarhijskog grupisanja koristenjem odredjenog
%algoritma povezivanja
%metoda: ward
%metrika: euklidska udaljednost - default
%prve dvije kolone cine indekse klastera povezanih u parove koje cine binarno stablo 
Z=linkage(X,'ward');

g=unique(Z(:,3)); %medjusobne udaljenosti cvorova, bez ponavljanja
e=sort(g); 
mk=(e>=1); %vektor sa vrijednosti 1 gdje je udaljenost cvorova >=1

m=e(mk); %vektor sa udaljenodstima medju cvorovima koje su >=1
%vrijednosti m koristene za odredjivanje slicnih primjera i grupisanja u
%isti klaster (ako je udaljenost medju njima manja od m-treshold)


figure;
pause(5);
for i=2:length(m)+1
    %plot dendrograma (ukoliko ima vise od 30 primjera u skupu podataka,
    %funkcija dendrogram ce sve primjere ispod grupisati medjusobno do posljednjih
    %30 (default), tj. dok ne ostane 30 klastera koje ce korisiti za
    %prikaz, a za P=0 prikazuju se svi primjeri na dendrogramu
    if(i<length(m)+1)
        subplot(1,2,1);
        H=dendrogram(Z,'ColorThreshold',m(i));
        sgtitle('Hijerarhijsko aglomerativno grupisanje korištenjem Ward metode povezivanja')
        title('Dendrogram')
        xlabel('# primjera u origilnalnom skupu X')
        ylabel('Udaljenost')
        set(H,'LineWidth',3)
    end
    
    if(i==length(m)+1) 
        %da se osigura da u posljednjem koraku budu svi klasteri povezani u
        %jedan na dendrogramu
        subplot(1,2,1);
        H=dendrogram(Z,'ColorThreshold',m(i-1)+1);
        sgtitle('Hijerarhijsko aglomerativno grupisanje korištenjem Ward metode povezivanja')
        title('Dendrogram')
        xlabel('# primjera u origilnalnom skupu X')
        ylabel('Udaljenost')
        set(H,'LineWidth',3)
    end

    %kreiranje klastera na osnovu povezanosti grupa, odn na osnovu stabla
    %hijerarhijskog grupisanja koje se debiva funkcijom linkage
    C=cluster(Z,'cutoff',m(i-1),'Criterion','distance');
    subplot(1,2,2);
    gscatter(X(:,1),X(:,2),C);
    title('Grupisani uzorci')
  
    if(i==2)
    pause(3);
    else
    pause(3);
    end
    if(i~=length(m)+1)
    clf
    end
end