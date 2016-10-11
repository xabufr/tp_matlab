function [ resultat ] = classify( aClassifier, modeleClassifieur )
    probaC1 = normpdf(aClassifier, modeleClassifieur.mu1, modeleClassifieur.sigma1);
    probaC2 = normpdf(aClassifier, modeleClassifieur.mu2, modeleClassifieur.sigma2);
    resultat = (probaC2 > probaC1) + 1;
end

