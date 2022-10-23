function ulaz = polumjesec(N, r1, r2, r3)
if nargin < 1
    N = 1000;
end
if mod(N,4) ~= 0
    N = round(N/4) * 4;
end
if nargin < 2
    r1 = 5;
end
if nargin < 3
    r2 = 10;
end
if nargin < 4
    r3 = 15;
end
N1 = N/4;
N2 = N-N1;
fi1 = rand(N1,1) * 2 * pi;
R1 = sqrt(rand(N1, 1));
moon = [cos(fi1) .* R1 * r1 sin(fi1) .* R1 * r1 zeros(N1,1)];
d = r3 - r2;
fi2 = pi + rand(N2,1) * pi;
R2 = sqrt(rand(N2,1));
crescent = [cos(fi2) .* (r2 + R2 * d) sin(fi2) .* (r2 + R2 * d) ones(N2,1)];
ulaz = [moon; crescent];