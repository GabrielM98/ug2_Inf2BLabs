% Exercise: Run MATLAB ’s K-means algorithm for K = 5 clusters and plot the data 
% together with the cluster means.

% Apply K-means with K = 5
[idx, c] = kmeans(A,5);

% Setup figure
figure;
xlabel(col_headers(1));
ylabel(col_headers(2)); 
axis([3.5 11 3.5 11]);
hold on;

% Colours for each group of clusters
colours = {'b','k','r','g','m'};

for i=1:5
    B = A(idx==i,:);
    scatter(c(i,1), c(i,2), 'filled', colours{i});
    scatter(B(:,1), B(:,2), 'x', colours{i});
end