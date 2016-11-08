function [ ] = Perceptron( C1, C2 )

v1 = ones(size(C1, 1), 1);
v2 = ones(size(C2, 1), 1);
Y = [v1 Cl; -v2 -Cl2];


Wprec = ones(size(Y, 1));
nu = 1 / 4;
Ym = calculer_mal_classes(Y, Wprec);
while(size(Ym, 1) ~= 0)
    Wsuiv = Wprec - nu .* calcul_gradient_MC(Ym);
    Wprec = Wsuiv;   
    Ym = calculer_mal_classes(Y, Wprec);
end

end

