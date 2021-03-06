function [ resultat ] = classifyVraisemblance( aClassifier, modeleClassifieur )
    probaC1 = mvnpdf(aClassifier, modeleClassifieur.mu1, modeleClassifieur.sigma1);
    probaC2 = mvnpdf(aClassifier, modeleClassifieur.mu2, modeleClassifieur.sigma2);
    
    resultat = (probaC2 > probaC1) + 1;
end

