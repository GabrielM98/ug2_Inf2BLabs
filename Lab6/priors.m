% Compute priors

% Total number of Scottish samples
N_S = size(xS,1);

% Total number of English samples
N_E = size(xE,1);

% Total examples
N_total = N_S + N_E;

% prior of Scottish samples
prior_S = N_E / N_total;

% prior of English samples
prior_E = 1 - prior_S;