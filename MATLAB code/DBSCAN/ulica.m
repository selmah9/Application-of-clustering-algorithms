function ulaz = ulica(N, odnos, sirina_prolaza, sirina_klastera)
    if nargin < 1
        N = 1000;
    end
    if mod(N,8) ~= 0
        N = round(N/8) * 8;
    end
    if nargin < 2
        odnos = 10;
    end
    if nargin < 3
        sirina_prolaza = 2;
    end   
    if nargin < 4
        sirina_klastera = 2;
    end
    tacke = N/4;
    xplusmin = [ones(tacke,1); -1*ones(tacke,1); ones(tacke,1); -1*ones(tacke,1)];
    yplusmin = [ones(tacke,1); -1*ones(2*tacke,1); ones(tacke,1)];
    
    horizontalno = [xplusmin(1:2:end) * sirina_prolaza + xplusmin(1:2:end) * odnos .* rand(N/2,1), ...
                  yplusmin(1:2:end) * sirina_prolaza + sirina_klastera * yplusmin(1:2:end) .* rand(N/2,1), ...
                  floor((0:N/2-1)'/(tacke*.5))];
       
    vertikalno = [xplusmin(2:2:end) * sirina_prolaza + sirina_klastera * xplusmin(2:2:end) .* rand(N/2,1), ...
                yplusmin(2:2:end) * sirina_prolaza + yplusmin(2:2:end) * odnos .* rand(N/2,1), ...
                floor((0:N/2-1)'/(tacke*.5))];
    
    ulaz=  [horizontalno; vertikalno];
end