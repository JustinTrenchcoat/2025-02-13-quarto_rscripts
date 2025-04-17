#| echo: fenced
library(tidyverse)
library(palmerpenguins)
library(tidymodels)

data <- penguins

# Initial cleaning: Remove missing values
data <- data %>% drop_na()

write_rds(data, "output/data_clean.RDS")