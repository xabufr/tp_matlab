n = 20;
noise = randn(n,1);
sizeNoise = 10;
x = rand(n,1).*50 + 5;
noise = rand(n,1) * sizeNoise;
pente = 0.8;
b =  20;
y = b + pente*x + noise;
z = [x y]

plot(x, y, 'o')
descenteGradient(z)