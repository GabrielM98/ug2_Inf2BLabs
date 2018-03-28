% Data in class S
xS = [10 8 10 10 11 11];

% Data in class T
xT = [12 9 15 10 13 13];

% Get the length of the data set
N = length(xS);

% Compute mean and variance for S class
mu_S_hat = 1/N * sum(xS)
s_S_hat = 1/N * sum(    (xS - mu_S_hat).^2)

% Compute mean and variance for T class
mu_T_hat = 1/N * sum(xT)
s_T_hat = 1/N * sum((xT - mu_T_hat).^2)