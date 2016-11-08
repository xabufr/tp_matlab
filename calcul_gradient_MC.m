function [ gradient ] = calcul_gradient_MC( Ym )
    gradient = -sum(Ym)';
end

