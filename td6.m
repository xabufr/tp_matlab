C1 = [1 2; 3 4; 2 3; 2.5 5];
C2 = [1 0; 3 3; 2 1];
modele = classifieurMCTer(C1, C2);

hold on;
plot(C1(:, 1), C1(:, 2), 'o')
plot(C2(:, 1), C2(:, 2), 'x')

x = [1; 3];
y = calculDroite2D(modele.W, x);
plot(x, y);
