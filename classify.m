function [ resultat ] = classify( aClassifier, modeleClassifieur )
    probaC1 = normpdf(aClassifier, modeleClassifieur.mu1, modeleClassifieur.sigma1);
    probaC2 = normpdf(aClassifier, modeleClassifieur.mu2, modeleClassifieur.sigma2);
    
    probaC1APosteriori = probaC1 .* modeleClassifieur.proba1 ./ (probaC1 + probaC2);
    probaC2APosteriori = probaC2 .* modeleClassifieur.proba2 ./ (probaC1 + probaC2);
    resultat = (probaC2APosteriori > probaC1APosteriori) + 1;
end

