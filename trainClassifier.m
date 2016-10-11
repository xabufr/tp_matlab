function [ modeleClassifieur ] = trainClassifier( trainC1, trainC2 )
    modeleClassifieur.mu1 = mean(trainC1);
    modeleClassifieur.sigma1 = sqrt(var(trainC1));
    
    modeleClassifieur.mu2 = mean(trainC2);
    modeleClassifieur.sigma2 = sqrt(var(trainC2));
    
    descenteGradient(trainC1)
end

