function [ V ] = calculACI( C1, C2 )
    mu1 = mean(C1)';
    mu2 = mean(C2)';
    S1 = cov(C1);
    S2 = cov(C2);
    Sw =  S1 + S2;
    Sb = (mu1 - mu2) * (mu1 - mu2)';
    invSw = inv(Sw);
    invSwSb = invSw * Sb;
    [V, d] = eig(invSwSb)
end

