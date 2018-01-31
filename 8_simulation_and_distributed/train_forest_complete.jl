using ScikitLearn, DecisionTree, JLD

# get command line arguments
# ARGS[1] = batch number
# ARGS[2] = number of trees for this batch
# ARGS[3] = file in which training data is stored
batch_num = parse(Int,ARGS[1])
num_trees = parse(Int,ARGS[2])
file = ARGS[3]

# load training data
data = readdlm(file,',')

n = size(data)[1]
p = size(data)[2] - 1
n_features = round(Int,p / 3)

# make output directory if necessary
try mkdir("model") end

# train trees
for i in 1:num_trees
	sample_indices = rand(1:n,n)
	model = DecisionTreeRegressor(maxlabels=1,nsubfeatures=n_features)
	fit!(model, data[sample_indices,2:end],data[sample_indices,1])
	JLD.save("model/model_" * string(batch_num) * "_" * string(i) * ".jld","model",model)
end

