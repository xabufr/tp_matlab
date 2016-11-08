Y = [10 2 3; -1 2 1; -1 2 3];
Wprec = [0; 0; 0];
Wsuiv = [1; -1; -1];
nu = 1 / 4;
Ym = calculer_mal_classes(Y, Wsuiv);
while((sum(abs(Wsuiv - Wprec)) > 0.001) && (size(Ym, 1) > 0))
    Wprec = Wsuiv;
    Wsuiv = Wprec + nu .* Ym(1, :)';
    Ym = calculer_mal_classes(Y, Wprec);
end
Ym
Wsuiv