clc;
clear all;
close all;

%ulaz=spirale(200,360,50,1.5,15);
%ulaz=polumjesec(2000)
%ulaz=ulica(1000)
ulaz=halfkernel(1000)
daljine=zeros(size(ulaz,1),size(ulaz,1));
for i=1:size(ulaz,1)
    for j=i:size(ulaz,1)
        daljine(i,j)=sqrt((ulaz(i,1:2)-ulaz(j,1:2))*(ulaz(i,1:2)-ulaz(j,1:2))');
    end
end
for i=1:size(ulaz,1)
    for j=i:size(ulaz,1)
        daljine(j,i)=daljine(i,j);
    end
end

%spiraleEps=0.5;
%polumjesecEps=1
%ulicaEps=1
%halfkernelEps=2
Eps=2
MinPts=4;
klaster = DBSCAN(daljine,Eps,MinPts);
x=ulaz(:,1);
y=ulaz(:,2);

figure
for i=1:max(klaster)
    hold on
    scatter(x(klaster==i),y(klaster==i),'filled');
end

hold on
scatter(x(klaster==0),y(klaster==0),'*')