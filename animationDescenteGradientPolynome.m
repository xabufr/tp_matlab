function [ ] = animationDescenteGradientPolynome()
xCurr = 5;
x = -1:0.05:7;
coefs = [30 -61 41 -11 1];
y = valeurPolynome(coefs, x);
derivee = Deriv(coefs);

figure;
hold on;

axis([-1 7 -10 100]);


plot(x,y);

xPrev = -999;

epsilon = 0.1;

nu = 0.01 %% sans l'att�nuation cela boucle du fait
   %%%  de la fonction choisie;
while(abs(xPrev - xCurr) > epsilon)
    
    plot(xCurr,valeurPolynome(coefs, xCurr),'or');
   
    xPrev = xCurr;
    
    xCurr = xPrev - valeurPolynome(derivee, xPrev)*nu
    pause(0.2);
end
plot(xCurr,valeurPolynome(coefs, xCurr),'og');
end
