C1 = [1 2 3; 4 5 6];
v = ones(size(C1, 1), 1);
Cl = [v C1];
C2 = [1 2 3; 4 5 6];
v = ones(size(C2, 1), 1);
Cl2 = [v C2];
Y = [Cl; -Cl2];



Y = [10 2 3; -1 2 1; -1 2 3];
Wprec = [1; -1; -1];
nu = 1 / 4;
Ym = calculer_mal_classes(Y, Wprec);
while(size(Ym, 1) ~= 0)
    Wsuiv = Wprec - nu .* calcul_gradient_MC(Ym);
    Wprec = Wsuiv;   
    Ym = calculer_mal_classes(Y, Wprec);
end


Y = [10 2 3; -1 2 1; -1 2 3];
Wprec = [1; -1; -1];
nu = 1 / 4;
Ym = calculer_mal_classes(Y, Wprec);
while(size(Ym, 1) ~= 0)
    Wsuiv = Wprec + nu .* Ym(1, :)';
    Wprec = Wsuiv;
    Ym = calculer_mal_classes(Y, Wprec);
end
