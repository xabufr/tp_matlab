function [ output_args ] = descenteGradient( trainC1 )
coefDir = -20;
coefDirSuiv = 0;

attenuation = 0.0008;

while(abs(coefDir - coefDirSuiv) > 0.9)
    coefDir = coefDirSuiv;
    coefDirSuiv = 0;
    for i=1:size(trainC1, 1)
       coefDirSuiv = coefDirSuiv + trainC1(i, 2) - (coefDir * trainC1(i, 1)) * trainC1(i, 1);
    end
    coefDirSuiv = coefDir + attenuation * coefDirSuiv;
end
moyennes = mean(trainC1);
W0 = moyennes(1, 2) - coefDirSuiv * moyennes(1, 1);
output_args = [W0 coefDirSuiv];
end

