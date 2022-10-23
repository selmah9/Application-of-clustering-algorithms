function ulaz = spirale(N, duzina, centar, sum,rep)
% duzina spirale u stepenima, centar udaljenost centra od ishodista koordinatnog sistema, u stepenima
% sum-koliko spirale ulaze jedna u drugu, 0 ne ulaze uopste, 1 preklapaju se
    if nargin < 1
        N = 200;
    end
    if nargin < 2
        duzina = 570;
    end
    if nargin < 3
        centar = 90;
    end
    if nargin < 5
        sum = 0.2;
    end  
    
    deg2rad = (2*pi)/360;
    centar = centar * deg2rad;
    N1 = floor(N/2);
    N2 = N-N1;
    
    n = centar + sqrt(rand(N1,1)) * duzina * deg2rad;
    d1=[];
    for i=1:rep
        d1 = [d1;[-cos(n).*n + rand(N1,1)*sum sin(n).*n+rand(N1,1)*sum zeros(N1,1)]];
    end
    
    n = centar + sqrt(rand(N1,1)) * duzina * deg2rad;    
    d2=[];
    for i=1:rep
        d2 = [d2;[cos(n).*n+rand(N2,1)*sum -sin(n).*n+rand(N2,1)*sum ones(N2,1)]];
    end
    
    ulaz = [d1;d2];
end