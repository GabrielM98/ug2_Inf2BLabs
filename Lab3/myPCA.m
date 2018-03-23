function myPCA(A)
    % Calculate covariance matrix
    N = size(A,1);
    a_mean = mean(A,1);
    A = bsxfun(@minus, A, a_mean);
    covar_m = 1/(N-1) * (A' * A);
    
    % Calculate eigenvectors and values of cov matrix
    [PC, V] = eig(covar_m);
    V = diag(V);
    
    % Sort eigenvalues in descending order
    [tmp, ridx] = sort(V,1,'descend');
    
    % Sort prinicipal components ie. e-vectors by eigenvalue
    PC = PC(:,ridx);
    
    % Project matrix A to principal component subspace
    PC_A = A * PC;
    
    % The first two columns of PC_A will then give us some data we can plot
    % Provided that the e-values are small we will not lose much info
    plot(PC_A(:,1), PC_A(:,2), 'o')
    xlabel('1st Principal Component');
    ylabel('2nd Principal Component');
    box on
end

