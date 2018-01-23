# We'll need both Keras and purrr for this script
library(keras)
library(purrr)

#### Data Pre-Processing ####

# I'm going to provide all this code up front; I'll walk through it though

# We're going to define the image size as a global constant
height <- 50
width <- 50

get_image <- function(file){
  # Reads in a image from a file and puts it into a matrix form
  # 
  # Args:
  #   file = the file to read in
  # Returns:
  #   a matrix representation of an image
  
  img <- image_load(path = file, target_size = c(height, width))
  img <- image_to_array(img = img)
  img <- array(data = img, dim = c(1, height, width, 3))
  return(img)
}

# Get a vector of all of the image files
img_files <- list.files(path = 'D:/image_data', full.names = TRUE,
                        recursive = TRUE)

# Define our X matrix
x <- array(dim = c(length(img_files), height, width, 3))

# Populate the X matrix
for (i in 1:length(img_files)){
  x[i, , ,] <- get_image(file = img_files[i])
}

# Normalize the data
x <- (x - mean(x)) / sd(x)

# Build the y vector
y <- map(.x = img_files, .f = ~ grepl(pattern = 'flooded_road',
                                      x = .x))
y <- unlist(y)
y <- as.integer(y)

# Create a train-test split for our data
set.seed(17)
idx <- sample(1:length(y), size = floor(.75 * length(y)))
x_train <- x[idx, , ,]
y_train <- y[idx]
x_test <- x[-idx, , ,]
y_test <- y[-idx]


#### CNNs ####

# Define the ConvNet model


# Evaluate the model


