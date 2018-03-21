function manhattan = manhattan_dist(U,v)
    manhattan = sum(abs(bsxfun(@minus, U, v)),2)';
end

