function [data_S, data_E] = generate_data(prior_S, prior_E, lik_S, lik_E, N)
% Generate N data samples based on priors and likelihood vectors
    
    rng(2);
    nm_features = size(lik_S,2);
    
    % Generate random prior vector of size N x 1
    rand_prior = rand(N,1);
    
    % Calculate no. of Scottish samples & no. of English samples
    nm_samples_S = sum(rand_prior < prior_S);
    nm_samples_E = size(rand_prior,1) - nm_samples_S;

    % Generate samples
    data_S = rand(nm_samples_S,nm_features) < prior_S;
    data_E = rand(nm_samples_E,nm_features) < prior_E;
end