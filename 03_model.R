library(tidyverse)
library(palmerpenguins)
library(tidymodels)

data <- read_rds("output/data_clean.RDS")

# Split data
set.seed(123)
data_split <- initial_split(data, strata = species)
train_data <- training(data_split)
test_data <- testing(data_split)
write_rds(test_data, "output/test_data.RDS")

# Define model
penguin_model <- nearest_neighbor(mode = "classification", neighbors = 5) %>%
  set_engine("kknn")

# Create workflow
penguin_workflow <- workflow() %>%
  add_model(penguin_model) %>%
  add_formula(species ~ .)

# Fit model
penguin_fit <- penguin_workflow %>%
  fit(data = train_data)

write_rds(penguin_fit, "output/model_fit.RDS")