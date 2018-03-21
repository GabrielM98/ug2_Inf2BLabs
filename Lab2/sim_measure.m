function similarity = sim_measure(r2)
% Convert Euclidean distance to similarity measure
similarity = 1 ./ (1 + r2);
end