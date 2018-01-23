# Load the keras library needed for the entirety of this script
library(keras)

#### Generate Data ####

# Set the seed for reproducibility
set.seed(17)

# Specify the number of samples (this can be changed later)
n_sample <- 1000

# Create a (n_sample x 1) matrix where the values are
# integers between [0, 20]


# Create random noise of integers between [-5, 5]


# Compute the test scores according to the x and 
# noise values


# Do a 75-25 split of our data so that we can have a train-test split
# to evaluate the model's performance
idx <- c(1:n_sample) <= 0.75 * dim(x)[1]


#### First Attempt -- Random Guessing ####

# Generate random uniform data between [50, 100]

# Compute the training SSR


#### Neural Network Basics ####

# Set the constants for this first model -- they should
# be reasonable values


# Define our model


# Set the constants for the new model -- we want an extreme
# learning rate to show its effect


# Define the model again


# Set an extremely low learning rate to see what it does to performance


# Define the model again


#### MNIST ####

# Get the MNIST data
mnist <- dataset_mnist()

# Split into training and testing
x_train <- mnist$train$x
y_train <- mnist$train$y

x_test <- mnist$test$x
y_test <- mnist$test$y


# We need to re-shape our data to be 2-d matrices so just use the following
# commands
x_train <- array_reshape(x_train, dim = c(dim(x_train)[1], 
                                          dim(x_train)[2] * dim(x_train)[3]))

x_test <- array_reshape(x_test, dim = c(dim(x_test)[1],
                                        dim(x_test)[2] * dim(x_test)[3]))


# Normalize the image data


# One-hot encode our y vectors


# Define a logistic regression model using the Keras API


# Evaluate the model's performance on the test set


# Define an MLP using the Keras API


# Evaluate the MLP's performance

