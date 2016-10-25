function [ out ] = projection( W, echantillon )
    out = transpose(W * echantillon');
end

