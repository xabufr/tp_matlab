function [ W ] = classifieurMC( C1, C2 )
    v = ones(size(C1, 1), 1);
    Yc1 = [v C1];
    v = ones(size(C2, 1), 1);
    Yc2 = [v C2];
    Y = [Yc1; -Yc2];
    b = ones(size(Y, 1), 1) .* 5;
    W = Y \ b;
end

