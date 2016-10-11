function [] = animationDescenteGradientParabole( )

x = -15:0.5:15
y = parabole(x)



hold on;

plot(x,y)
xPos = -10;
xPrev = 999;
epsilon = 0.1;
i=0;
while(abs(xPos - xPrev) > epsilon)
    xPrev = xPos;    
    derivee = 2 .* xPos;
    xPos = xPrev - (derivee * i);
    
    plot(xPos, parabole(xPos), 'or');
    
    pause(0.2);
    i = i + 1;
end
end

