function [ tauxC1, tauxC2 ] = testClassifier( testC1, testC2, modele)
    ResC1 = classify(testC1, modele);
    ResC2 = classify(testC2, modele);
    % Calculs des taux d'erreur
    nbC2Erreur = 2*size(ResC2,1) - sum(ResC2);
    nbC1Erreur = sum(ResC1) - size(ResC1,1);
    tauxC2 = (nbC2Erreur * 100 / size(testC2, 1));
    tauxC1 = (nbC1Erreur * 100 / size(testC1, 1));
end

