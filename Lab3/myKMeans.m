function myKMeans(A, centres)
    fprintf('[0] Iteration: ')
    centres % Show cluster centres at iteration 0
    
    N = size(A,1);
    K = size(centres, 1); % No. of clusters
    D = zeros(K, N);

    % Iterate 100 times or until cluster centres don't move
    for i = 1:100
        % Compute squared Euclidean distances (ie. the squared distance)
        % between each cluster centre and each observation
        for c = 1:K
            D(c, :) = square_dist(A, centres(c, :));
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
                warning("k-means: cluster %d is empty", c)
            else
                centres(c, :) = mean(A(idx==c, :));
            end
        end

        % Check if cluster centres have moved since previous iteration
        if(idx_prev == centres)
            break;
        end
        
        sum_squared_error = 0;
        % Calculate sum squared error for iteration i
        for c = 1:K
            member_mat = A(idx==c,:);                                                  % Matrix of points that belong to cluster c
            centre_sub_mat = member_mat - repmat(centres(c, :), size(member_mat,1),1); % Subtracts cluster centre from each point
            l2_norm_mat = sqrt(sum(centre_sub_mat.^2,2));                              % Calculates L2 norm of each vector
            sum_squared_error = sum(l2_norm_mat,1) + sum_squared_error;
        end
        

        fprintf("[%d] Iteration: ", i);
        centres % Show cluster centres at iteration i
        fprintf("Sum squared error: %d\n\n", sum_squared_error * 1/N);

    end    
end

