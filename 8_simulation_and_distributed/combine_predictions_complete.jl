using JLD

# Get command-line arguments
# ARGS[1] = number of batches used in prediction
# ARGS[2] = file for test data
# ARGS[3] = directory in which predictions are stored
num_batches = parse(Int,ARGS[1])
file = ARGS[2]
pred_dir = ARGS[3]

# load test data
data = readdlm(file,',')
y_test = data[:,1]

# combine predictions from various batches
y_pred = zeros(length(y_test))
num_trees = 0
for b in 1:num_batches
	tmp = JLD.load(pred_dir * "/predictions_" * string(b) * ".jld","predictions")
	num_trees = num_trees + size(tmp)[2]
	y_pred = y_pred + sum(tmp,2)
end


# compute and print R^2
y_pred = y_pred / num_trees
println(1 - sum((y_pred - y_test).^2) / sum((y_test - mean(y_test)).^2))
