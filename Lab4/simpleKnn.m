function [prediction] = simpleKnn(train, test, classes, Knn)
    % Note - you need to cluster the data prior to classifying as kmeans function
    % starts with random partition and hence the cluster centres can vary
    % each time.

    % Determines number of samples in test data
    points = size(test, 1);
    
    % Initialises prediction matrix
    prediction = zeros(points,1);
    
    % Classifies each test sample
    for i=1:points
        r_zx = square_dist(train, test(i,:));
        [r_zx, idx] = sort(r_zx, 2, 'descend');
        idx = idx(1:Knn);
        
        prediction(i,1) = mode(classes(idx));
    end
end