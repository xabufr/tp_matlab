% Écrire myclassifier
% Écrire extractTrainTest
load DonneesCC.mat

nbIter = 100;
erreursC1pourC1C2 = [];
erreursC1pourC1C3 = [];
erreursC2pourC1C2 = [];
erreursC2pourC2C3 = [];
erreursC3pourC1C3 = [];
erreursC3pourC2C3 = [];
%calculACI(VTC2, VTC1);
% Calcul du PCA sur l'ensemble des échantillons
%[vecteursPopres, VTC2Reduit, VTC1Reduit] = calculPCA(VTC2, VTC1);
%vecteurProjectionACI = calculACI(VTC2, VTC1)
%matriceProjection = transpose(vecteurProjectionACI(:, 1));
% Réduction en dimension par PCA
%VTC2Reduit = projection(matriceProjection, VTC2Reduit);
%VTC1Reduit = projection(matriceProjection, VTC1Reduit);

for	i=1:nbIter
    % Exctraction des jeux de tests
    %[vecteursPopres, x1_red, x2_red, x3_red] = calculPCA(x1, x2, x3);
    %matriceProjection = transpose(vecteursPopres(:, 1));
    
    vecteurProjectionACI = calculACI(x1, x2, x3)
    matriceProjection = transpose(vecteurProjectionACI(:, 1));
    
    x1_red = projection(matriceProjection, x1);
    x2_red = projection(matriceProjection, x2);
    x3_red = projection(matriceProjection, x3);

    [testC1, trainC1] = extractTestAndTrain(x1_red, 10);
    [testC2, trainC2] = extractTestAndTrain(x2_red, 10);
    [testC3, trainC3] = extractTestAndTrain(x3_red, 10);
    modeleClassifieurC1C2 = trainClassifier(trainC1, trainC2);
    modeleClassifieurC1C3 = trainClassifier(trainC1, trainC3);
    modeleClassifieurC2C3 = trainClassifier(trainC2, trainC3);

    % Classification
    [tauxC1, tauxC2] = testClassifier(testC1, testC2, modeleClassifieurC1C2);    
    erreursC2pourC1C2 = [erreursC2pourC1C2; tauxC2];
    erreursC1pourC1C2 = [erreursC1pourC1C2; tauxC1];
    [tauxC1, tauxC3] = testClassifier(testC1, testC3, modeleClassifieurC1C3);    
    erreursC3pourC1C3 = [erreursC3pourC1C3; tauxC3];
    erreursC1pourC1C3 = [erreursC1pourC1C3; tauxC1];
    [tauxC2, tauxC3] = testClassifier(testC2, testC3, modeleClassifieurC2C3);    
    erreursC2pourC2C3 = [erreursC2pourC2C3; tauxC2];
    erreursC3pourC2C3 = [erreursC3pourC2C3; tauxC3];
end;
hold on;
boites = [erreursC1pourC1C3 erreursC1pourC1C2 erreursC2pourC1C2 erreursC2pourC2C3 erreursC3pourC2C3 erreursC3pourC1C3 ];
boxplot(boites, 'Labels', {'C1/C1C3','C1/C1C2','C2/C1C2','C2/C2C3','C3/C2C3','C3/C1C3'});
