function [ resultat ] = classify( aClassifier, modeleClassifieur )
    probaC1 = mvnpdf(aClassifier, modeleClassifieur.mu1, modeleClassifieur.sigma1);
    probaC2 = mvnpdf(aClassifier, modeleClassifieur.mu2, modeleClassifieur.sigma2);
    
    probaC1APosteriori = probaC1 .* modeleClassifieur.proba1;
    probaC2APosteriori = probaC2 .* modeleClassifieur.proba2;
    resultat = (probaC2APosteriori > probaC1APosteriori) + 1;
end

