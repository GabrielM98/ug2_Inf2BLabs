% Estimated likelihood vector for each feature, Scottish class
lik_S = sum(xS) / N_S; % or just use : mean(xS)

% Estimate likelihood vector for each feature, English class
lik_E = sum(xE) / N_E;

% Test example
x = [1 1 1 1 1];

% Compute P(C = S) * P(x|C = S) = P(x, C = S)
test_prod_S = prior_S * prod((lik_S.^x) .* (1-lik_S).^(1-x))

% Compute P(C = E) * P(x|C = E) = P(x, C = E)
test_prod_E = prior_E * prod((lik_E.^x) .* (1-lik_E).^(1-x))

% or equivalently we could compute the Bayes decision rule
MAP = test_prod_S / test_prod_E;

% Compute posterior probability by normalising test_prod_S
test_post_S = test_prod_S / (test_prod_S + test_prod_E);