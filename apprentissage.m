% Écrire myclassifier
% Écrire extractTrainTest
muSaumon = [12 12];
sigmaSaumon = [4 0.4];
muBar = [8 8];
sigmaBar = [1 0.1];
sizeVT = 1000;
VTSaumon = mvnrnd(muSaumon,sigmaSaumon,	sizeVT);
VTBar = mvnrnd(muBar,sigmaBar,sizeVT);

nbIter = 100;
sizeTrain = 100;
erreursSaumon = [];
erreursBar = [];    

calculACI(VTSaumon, VTBar);
% Calcul du PCA sur l'ensemble des échantillons
[vecteursPopres, VTSaumonReduit, VTBarReduit] = calculPCA(VTSaumon, VTBar);
vecteurProjectionACI = calculACI(VTSaumon, VTBar)
matriceProjection = transpose(vecteurProjectionACI(:, 1));
% Réduction en dimension par PCA
VTSaumonReduit = projection(matriceProjection, VTSaumonReduit);
VTBarReduit = projection(matriceProjection, VTBarReduit);

for	i=1:nbIter
    % Exctraction des jeux de tests
    [testBar, trainBar] = extractTestAndTrain(VTBarReduit, 10);
    [testSaumon, trainSaumon] = extractTestAndTrain(VTSaumonReduit, 10);
    modeleClassifieur = trainClassifier(trainBar, trainSaumon);

    % Classification
    ResBar = classifyVraisemblance(testBar,modeleClassifieur);
    ResSaumon = classifyVraisemblance(testSaumon,modeleClassifieur);
    % Calculs des taux d'erreur
    nbSaumonErreur = 2*size(ResSaumon,1) - sum(ResSaumon);
    nbBarErreur = sum(ResBar) - size(ResBar,1);
    tauxSaumon = (nbSaumonErreur * 100 / size(testSaumon, 1));
    tauxBar = (nbBarErreur * 100 / size(testBar, 1));
    erreursSaumon = [erreursSaumon tauxSaumon];
    erreursBar = [erreursBar tauxBar];
end;
hold on;
plot([1:nbIter], erreursSaumon, 'r');
plot([1:nbIter], erreursBar, 'b');