function [ V ] = calculACI( C1, C2, C3 )
    mu1 = mean(C1)';
    mu2 = mean(C2)';
    mu3 = mean(C3)';
    mu = (mu1 + mu2 + mu3) ./3;
    
    S1 = cov(C1);
    S2 = cov(C2);
    S3 = cov(C3);
    Sw =  S1 + S2 + S3;
    
    n1 = size(C1, 1);
    n2 = size(C2, 1);
    n3 = size(C3, 1);
    
    sb1 = n1.* (mu1-mu)'*(mu1-mu); 
    sb2 = n2.* (mu2-mu)'*(mu2-mu); 
    sb3 = n3.* (mu3-mu)'*(mu3-mu); 

    Sb = sb1 + sb2 + sb3;
    invSw = inv(Sw);
    invSwSb = invSw * Sb;
    [V, d] = eig(invSwSb)
end

