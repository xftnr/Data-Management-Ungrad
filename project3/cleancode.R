library(tidyverse)
csvURL <- "https://query.data.world/s/onno6abkrk2w6fo43w23dwm4xxfmmy"
df <- read_csv(csvURL, col_types = list(
  age = col_number(),
  workclass = col_character(),
  fnlwgt = col_number(),
  education = col_character(),
  'education-num' = col_number(),
  'marital-status' = col_character(),
  occupation = col_character(),
  relationship = col_character(),
  race = col_character(),
  sex = col_character(),
  'capital-gain' = col_number(),
  'capital-loss' = col_number(),
  'hours-per-week' = col_number(),
  'native-country' = col_character(),
  class = col_character()
))
# Change .+ and -+ in column names to _
names(df) <- gsub("\\.+", "_", names(df))
names(df) <- gsub("-+", "_", names(df))
# Remove non-printable characters from column names.
names(df) <- gsub("[^ -~]", "", names(df))
# Remove null values in the row.
df <- df[-grep("\\?",df$workclass),]
# Change ? in country to other
df$native_country <- gsub("\\?", "Other", df$native_country)
# Remove non-printable characters from all column values.
df <- df %>% dplyr::mutate_all(funs(gsub(pattern="[^ -~]", replacement= "", .)))
# The following write_csv followed immediately by a read_csv, fixes the column types.
write_csv(df, "tmp.csv") 
df <- read_csv("tmp.csv", col_types = list(
  age = col_number(),
  workclass = col_character(),
  fnlwgt = col_number(),
  education = col_character(),
  education_num = col_number(),
  marital_status = col_character(),
  occupation = col_character(),
  relationship = col_character(),
  race = col_character(),
  sex = col_character(),
  capital_gain = col_number(),
  capital_loss = col_number(),
  hours_per_week = col_number(),
  native_country = col_character(),
  class = col_character()
))
# Now save the cleaned data to new.csv
write_csv(df, "adult_new.csv")
# Now load new.csv into a data.world Dataset.