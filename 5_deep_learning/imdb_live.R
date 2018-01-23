library(keras)
library(ggplot)
library(purrr)

#### Data Pre-Processing ####

# We'll get the data
imdb <- dataset_imdb()

# Train-Test split
x_train <- imdb$train$x
y_train <- imdb$train$y
x_test <- imdb$test$x
y_test <- imdb$test$y

# Plot the word distribution in the training set -- we're trying to limit
# the vocabulary size so knowing the distribution will help; do this in
# ggplot as a refresher from the second class
df <- data.frame(unlist(x_train))
colnames(df) <- "vocab"

# I would like you to also plot the distribution of review lengths
# we have to get all the reviews to the same length so having a good idea of
# how long most reviews ought to be a good indicator of what this value should
# be -- again do this in ggplot

# Hint: do get the review length consider using purrr 


# Now that we know how large our vocabulary size should be and how long
# the reviews should be we can get our data set again under these conditions


# We will also need to pad our text sequences which are not as long as the 
# required length


#### Sentiment Analysis ####

# Define the model which will allow us to sentiment analysis


# Evaluate the model's performance

