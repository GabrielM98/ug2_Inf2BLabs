% Create a 5x3 matrix
A = [ 1 2 3;
      4 5 6;
      7 8 9;
      10 11 12;
      13 14 15];
% Printing command
fprintf("\nComputing column means: \n");
[I, J] = size(A);
mu = zeros(1, J); % allocate space for answer
for i = 1:I
    for j = 1:J
        mu(j) = mu(j) + A(i,j);
    end
end
mu = mu / I
% result should be: 7 8 9