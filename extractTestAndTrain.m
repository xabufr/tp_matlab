function [ test, train ] = extractTestAndTrain( VT, pourcentTest )
    count = ceil(size(VT, 1) * pourcentTest / 100);
    randIndices = randperm(size(VT,1));
    test = VT(randIndices(1:count), 1:end);
    train = VT(randIndices(count+1:size(randIndices, 2)), 1:end);
end