function data = halfkernel(N, minx, r1, r2, sum, odnos)
if nargin < 1
    N = 1000;
end
if mod(N,2) ~= 0
    N = N + 1;
end
if nargin < 2
    minx = -20;
end
if nargin < 3
    r1 = 20;
end
if nargin < 4
    r2 = 35;
end
if nargin < 5
    sum = 4;
end
if nargin < 6
    odnos = 0.6;
end
fi1 = rand(N/2,1) * pi;
unutrasnjost = [minx + r1 * sin(fi1) - .5 * sum  + sum * rand(N/2,1) r1 * odnos * cos(fi1) - .5 * sum + sum * rand(N/2,1) ones(N/2,1)];
    
fi2 = rand(N/2,1) * pi;
vanjski = [minx + r2 * sin(fi2) - .5 * sum  + sum * rand(N/2,1) r2 * odnos * cos(fi2) - .5 * sum  + sum * rand(N/2,1) zeros(N/2,1)];
data = [unutrasnjost; vanjski];
end