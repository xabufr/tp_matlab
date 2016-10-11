function [ test, train ] = extractTestAndTrain( VT, pourcentTest )
    count = ceil(size(VT, 1) * pourcentTest / 100);
    randIndices = randperm(size(VT,1));
    test = VT(randIndices(1:count));
    train = VT(randIndices(count+1:size(randIndices, 2)));
end