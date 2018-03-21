function sq_dist = my_square_dist(U,v)
    U_sub = (U - repmat(v, size(U,1), 1)).^2; % Squares each element in U_sub after subtracting v
    sq_dist = sum(U_sub, 2)';                 % Sums each row in U_sub and returns the row vector
end