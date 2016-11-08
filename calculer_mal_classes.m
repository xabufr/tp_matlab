function [ Ym ] = calculer_mal_classes(Y, W)
    mal_classes = (Y * W);
    Ym = Y(mal_classes < 0, :);
end

