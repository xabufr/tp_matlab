% Écrire myclassifier
% Écrire extractTrainTest
muSaumon = 14;
sigmaSaumon = 4;
muBar = 10;
sigmaBar = 2;
sizeVT = 1000;
VTSaumon = mvnrnd(muSaumon,sigmaSaumon,	sizeVT);
VTBar = mvnrnd(muBar,sigmaBar,sizeVT);

nbIter = 100;
sizeTrain = 100;
erreursSaumon = [];
erreursBar = [];
for	i=1:nbIter   
    [testBar, trainBar] = extractTestAndTrain(VTBar, 10);
    [testSaumon, trainSaumon] = extractTestAndTrain(VTSaumon, 10);
    
    modeleClassifieur = trainClassifier(trainBar, trainSaumon);

    ResBar = classify(testBar,modeleClassifieur);
    ResSaumon = classify(testSaumon,modeleClassifieur);
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