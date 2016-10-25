% Écrire myclassifier
% Écrire extractTrainTest
muC2 = [12 12];
sigmaC2 = [4 0.4];
muC1 = [8 8];
sigmaC1 = [1 0.1];
sizeVT = 1000;
VTC2 = mvnrnd(muC2,sigmaC2,	sizeVT);
VTC1 = mvnrnd(muC1,sigmaC1,sizeVT);

nbIter = 100;
sizeTrain = 100;
erreursC2 = [];
erreursC1 = [];    

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
    [testC1, trainC1] = extractTestAndTrain(VTC1, 10);
    [testC2, trainC2] = extractTestAndTrain(VTC2, 10);
    modeleClassifieur = trainClassifier(trainC1, trainC2);

    % Classification
    ResC1 = classify(testC1,modeleClassifieur);
    ResC2 = classify(testC2,modeleClassifieur);
    % Calculs des taux d'erreur
    nbC2Erreur = 2*size(ResC2,1) - sum(ResC2);
    nbC1Erreur = sum(ResC1) - size(ResC1,1);
    tauxC2 = (nbC2Erreur * 100 / size(testC2, 1));
    tauxC1 = (nbC1Erreur * 100 / size(testC1, 1));
    erreursC2 = [erreursC2 tauxC2];
    erreursC1 = [erreursC1 tauxC1];
end;
hold on;
plot([1:nbIter], erreursC2, 'r');
plot([1:nbIter], erreursC1, 'b');