n = 20;
noise = randn(n,1);
sizeNoise = 10;
x = rand(n,1).*50 + 5;
noise = rand(n,1) * sizeNoise;
pente = 0.8;
b =  20;
y = b + pente*x + noise;
z = [x y];

hold on;
plot(x, y, 'o')
droite = descenteGradient(z);
plot(x, droite(2) * x + droite(1), 'r');
droiteSystemeLineaire = systemeLineaire(z)
plot(x, droiteSystemeLineaire(2) * x + droiteSystemeLineaire(1), 'b');

droiteRegress = regress(y, [ones(size(x)) x]);
%% Commenté car exactement identique à droiteSystemeLineaire, qui est donc
%% masquée...
% plot(x, droiteRegress(2) * x + droiteRegress(1), 'g');
