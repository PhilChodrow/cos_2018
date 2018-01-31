using ScikitLearn, DecisionTree, JLD

# get command line arguments
# ARGS[1] = batch number
# ARGS[2] = number of trees in this batch
# ARGS[3] = file of test data
# ARGS[4] = directory where model is stored
batch_num = parse(Int,ARGS[1])
num_trees = parse(Int,ARGS[2])
file = ARGS[3]
model_dir = ARGS[4]

# load test data
data = readdlm(file,',')


# compute predictions for each tree
y_pred = zeros(size(data)[1],num_trees)

for i in 1:num_trees
	model = JLD.load(model_dir * "/model_" * string(batch_num) * "_" * string(i) * ".jld","model")
	y_pred[:,i] = predict(model, data[:,2:end])
end


# save predictions to disk
try mkdir("predictions") end
JLD.save("predictions/predictions_" * string(batch_num) * ".jld","predictions",y_pred)
