function [ V, Cl1, Cl2, Cl3 ] = calculPCA( C1, C2, C3 )
    P = [C1; C2; C3];
    mu = mean([C1; C2; C3]);
    C = P - repmat(mu, size(P, 1), 1);
    Cl1 = C1 - repmat(mu, size(C1, 1), 1);
    Cl2 = C2 - repmat(mu, size(C2, 1), 1);
    Cl3 = C3 - repmat(mu, size(C3, 1), 1);

    S = (size(C, 1) - 1) * cov(C);
    [V, lambda] = eigs(S);
    % W2 = transpose([V(:, 1), V(:, 2)])
%     CProj2 = transpose(W2 * C')
end

