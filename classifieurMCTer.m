function [ modele ] = classifieurMCTer( C1, C2 )
v = ones(size(C1, 1), 1);
Yc1 = [v C1];
v = ones(size(C2, 1), 1);
Yc2 = [v C2];
Y = [Yc1; -Yc2];

nu = 0.01;
bSuiv = ones(size(Y, 1), 1);
for i = 1:10000
    bPrec = bSuiv;
    W = Y \ bPrec;
    bSuiv = bPrec + nu * 2 * (Y * W - bPrec);
end

modele.W = W;
modele.b = bPrec;

end

