setwd("A:/")

# Load necessary package
library(dplyr)

# Read the CSV file
file_path <- "original_db_additional_columns(in).csv"
df <- read.csv(file_path, stringsAsFactors = FALSE)

# Extract and clean Instagram usernames
instagram_usernames <- df %>%
  filter(!is.na(instagram_link)) %>%
  mutate(username = sub(".*instagram.com/([^/]+)/?.*", "\\1", instagram_link)) %>%
  distinct(username)  # Remove duplicates

count(instagram_usernames)
# Save as a text file with each username on a new line
writeLines(instagram_usernames$username, "instagram_usernames.txt")

# Print confirmation message
print("Instagram usernames list has been saved as 'instagram_usernames.txt'")



