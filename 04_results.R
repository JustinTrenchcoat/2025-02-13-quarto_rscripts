library(stats)
library(readr)
library(tidymodels)

test_data <- read_rds("output/test_data.RDS")
penguin_fit <- read_rds("output/model_fit.RDS")
# Predict on test data
predictions <- predict(penguin_fit, test_data, type = "class") %>%
  bind_cols(test_data)

# Confusion matrix
conf_mat <- conf_mat(predictions, truth = species, estimate = .pred_class)
conf_mat
write_rds(conf_mat, "output/confusion_matrix.RDS")