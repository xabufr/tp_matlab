function [ droite ] = systemeLineaire( nuage )
%SYSTEMELINEAIRE Summary of this function goes here
%   Detailed explanation goes here
    covMat = cov(nuage(:,1),nuage(:,2));
    coeff = (covMat(2,1) / covMat(1,1));
       
    moyenne = mean(nuage);
   
    ord = moyenne(1,2) - coeff * moyenne(1,1);

    droite = [ord, coeff]
end
