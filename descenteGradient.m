function [ output_args ] = descenteGradient( trainC1 )
teta = [-10; -10];
tetaSuiv = [0; 0];

while(sum(tetaSuiv - teta) > 1)
    diffTeta = [0;0];
    teta = tetaSuiv;
    for i=1:size(trainC1, 1)
        %diffTeta(1, 1) = 
        diffTeta(1, 1) + teta * trainC1(i, 1) - trainC1(i, 2)
        diffTeta(2, 1) = diffTeta(2, 1) + trainC1(i, 1) * transpose(teta) * trainC1(i, 1) - trainC1(i, 2);
    end
    attenuation = 0.01;
    tetaSuiv = teta - attenuation * diffTeta;
end
output_args = teta;
end

