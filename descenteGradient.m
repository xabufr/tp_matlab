function [ output_args ] = descenteGradient( trainC1 )
teta = [0; 0];
tetaSuiv = [10; 10];

while(sum(tetaSuiv - teta) < 1)
    diffTeta = [0;0];
    for i=1:size(trainC1, 1)
        diffTeta(1, 1) = diffTeta(1, 1) + transpose(teta) * trainC1(1, i) - trainC1(2, i);
        diffTeta(2, 1) = diffTeta(2, 1) + trainC1(1, i) * transpose(teta) * trainC1(1, i) - trainC1(2, i);
    end
    attenuation = 0.01;
    tetaSuiv = teta - attenuation * diffTeta;
end
output_args = teta;
end

