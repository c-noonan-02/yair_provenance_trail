rm(list=ls())

library(dplyr)

# import the data we gathered in the field
pine_trait_data <- read.csv("./data/pine_data.csv", sep=";")
View(pine_trait_data)
# import the data provided by CEH
pine_data <- read.delim("./data/fieldtraits_v2.txt")
View(pine_data)

pine_trait_data <-
  pine_trait_data %>%
  rename(
    FieldCode = id,
    ObserverGroup = group,
    DBH = dbh,
    LengthUp = length_up,
    LengthRight = length_right,
    LengthDown = length_down,
    LengthLeft = length_left,
    RetentionUp = retention_up,
    RetentionRight = retention_right,
    RetentionDown = retention_down,
    RetentionLeft = retention_left
  )

all_pine_data <- pine_data %>% inner_join(pine_trait_data, by = "FieldCode")
View(filtered_pine_data)

