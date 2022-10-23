clc
clear all
close all
% Kreiranje ta?aka 
S = [0.5 0.05; 0.05 0.5];
f1    = mvnrnd([0.5 0]  ,S,100);
f2    = mvnrnd([0.5 0.5],S,100);
f3    = mvnrnd([0.5 1]  ,S,100);
f4    = mvnrnd([0.5 1.5],S,100);

F     = [f1;f2;f3;f4]; % Ulaz                             
K = 8;                 % Broj klastera
N = 40;                % K-means broj iteracija
% Pozivanje funkcije za K-means klasterizaciju
[cluster_centers, data]  = km_fun(F, K, N); 
  
BK    = '+r+b+c+m+k+yorobocomokoysrsbscsmsksy';       % Vektor za boje klastera
hold on
 for i = 1 : K
PT = F(data(:, K+1) == i, :);                % Pronalazak ta?ke za svaki klaster    
plot(PT(:, 1),PT(:, 2),BK(2*i-1 : 2*i), 'LineWidth', 2);                   % Crtanje ta?aka sa odre?enom bojom i 
                                                                           % oblikom prema klasteru kojem pripada
plot(cluster_centers(:, 1), cluster_centers(:, 2), '*k', 'LineWidth', 7);  % Crtanje centroida
 end
legend ('Klaster 1', 'Centroid', 'Klaster 2', 'Centroid', 'Klaster 3', 'Centroid', 'Klaster 4', 'Centroid', 'Klaster 5', 'Centroid', 'Klaster 6', 'Centroid', 'Klaster 7', 'Centroid', 'Klaster 8'); 
title ('K-means algoritam grupisanja, K=8'); 
hold off
grid on