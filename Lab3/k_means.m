fprintf('[0] Iteration: ')
centres % Show cluster centres at iteration 0

K = 2; % No. of clusters

% Iterate 100 times or until cluster centres don't move
for i = 1:100
    % Compute squared Euclidean distances (ie. the squared distance)
    % between each cluster centre and each observation
    for c = 1:K
        D(c, :) = square_dist(A, centres(c, :)); % Creates row vector for each cluster centre
    end

    % Assign data to clusters
    % Ds are the actual distances and idx are the cluster assignments
    [Ds, idx] = min(D); % find min dist. for each observation, idx indicates assigned cluster
    
    % Creates a matrix of previous cluster centre assignments
    idx_prev = centres;

    % Update cluster centres
    for c = 1:K
        % Check the number of samples assigned to this cluster
        if(sum(idx==c) == 0)
            warn("k-means: cluster %d is empty", c);
        else
            centres(c, :) = mean(A(idx==c, :));
        end
    end
    
    % Check if cluster centres have moved since previous iteration
    if(idx_prev == centres)
        break;
    end
    
    fprintf("[%d] Iteration: ", i);
    centres % Show cluster centres at iteration i

end
