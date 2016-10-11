function [ C1, C2 ] = acquerirDonnees()
muSaumon = 12;
sigmaSaumon = 4;
muBar = 10;
sigmaBar = 2;
sizeVT = 1000;
C1 = mvnrnd(muSaumon,sigmaSaumon,	sizeVT);
C2 = mvnrnd(muBar,sigmaBar,sizeVT);
end

