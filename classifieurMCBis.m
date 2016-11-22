function [ W] = classifieurMCBis( C1, C2 )
v = ones(size(C1, 1), 1);
Yc1 = [v C1];
v = ones(size(C2, 1), 1);
Yc2 = [v C2];
Y = [Yc1; -Yc2];

b = 1;

Wprec = zeros(size(Y, 2), 1);
Wsuiv = Wprec + 1;
nu = 0.001
for i = 1:1000
    Wprec = Wsuiv
    Wsuiv = Wprec - nu * 2 * Y' * (Y * Wprec - b);
end
W = Wsuiv
end
