# Name: Crystal Hollis
# ITSE 2309-82700 Database Programming
# Date: 03/04/2025
# Lab 5 Visualizing Data: Plot the ramen data
# Famous person I admire: Alfred Molina

# Dataset File: ramen-ratings.csv, in ~/data/ramen-ratings.csv

# Current Directory
getwd()

# Set Directory
# Copy and paste filepath to where ramen-ratings.csv is located
setwd("/Users/magnamediaartsllc/GitHub/DallasCollege_Portfolio/ITSE2309_DatabaseProgramming/Lab5/data") 

# Verify Current Directory
getwd()

# Load required packages
library(tidyverse)

#Tasks
# 1.	Read the data from the CSV file into a tibble and display it. To do that, 
#     you can use the read_csv() function like this:
#       ramen <- read_csv("ramen-ratings.csv")
ramen <- read_csv("ramen-ratings.csv")

# Check the first few rows
head(ramen)

# Check column names
names(ramen)

# Assign Styles with NA value as "Misc" so it won't appear as missing value
ramen <- ramen %>%
  mutate(Style = ifelse(is.na(Style), "Misc", Style))

# Count rows for each style
ramen %>%
  count(Style)

# Convert Stars to numeric
ramen <- ramen %>%
  mutate(Stars = as.numeric(Stars))

# Count rows for each Stars
ramen %>%
  count(Stars)

# 2.	Create a bar plot that shows the count of rows for each style.
ggplot(ramen, aes(x = Style)) +
  geom_bar(fill = "skyblue") +
  ggtitle("Count of Ramen by Style") +
  xlab("Style") +
  ylab("Count of Rows")

# Observation: Cup style is the most common, followed by Pack.

# 3.	Create a box plot that shows the distribution of the Stars values for 
#     each style.

# Drop unrated rows so that only the rated ramen are in the box plot
ramen <- ramen %>%
  filter(!is.na(Stars))

# Box plot showing showing Stars per style, breaks set to whole numbers
ggplot(ramen, aes(x = Style, y = Stars, fill = Style)) +
  geom_boxplot() +
  ggtitle("Stars Distribution by Style") +
  xlab("Style") +
  ylab("Stars") +
  scale_y_continuous(breaks = seq(0, 5, by = 1)) +  # This sets breaks at 0, 1, 2, 3, 4, 5
  theme_minimal() +
  theme(
    legend.position = "right",
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
  )

# Observation: Some styles (like Pack) have wider star ranges than others.
  
# 4.	Modify the plot you just created to only use data from the USA.
#     Filter for USA data only
usa_ramen <- filter(ramen, Country == "USA")

# Box plot for USA only
ggplot(usa_ramen, aes(x = Style, y = Stars, color = Style)) +
  geom_boxplot() +
  ggtitle("Stars Distribution by Style in the USA") +
  xlab("Style") +
  ylab("Stars")

# Observation: USA’s Cup ramen shows wider spread compared to Pack style.
  
# 5.	Create a new tibble that only contains data from Japan, India, Taiwan, and 
#     the USA. Then, create a boxplot that shows the distribution of stars by style for each country on a subplot with two subplots per row.

# Create tibble for selected countries
selected_ramen <- filter(ramen, Country %in% c("Japan", "India", "Taiwan", "USA"))

# Check tibble
print(selected_ramen)

# 6.	Create a histogram of the tibble you created in step 5 that uses 12 bins 
#     to display the distribution of the Stars values.

# Box plot, by country (2 plots per row)
ggplot(selected_ramen, aes(x = Style, y = Stars, fill = Style)) +
  geom_boxplot() +
  facet_wrap(vars(Country), ncol = 2) +
  ggtitle("Stars Distribution by Style (Selected Countries)") +
  xlab("Style") +
  ylab("Stars")

# Observation: Japan's ramen tends to receive higher average stars.

# 7.	Insert comments below each of your ggplot() commands in your RScript 
#     listing at least one observation you noted from each of the 3 plots you 
#     created. 

# 8.	At the top of your script insert a comment that includes your name, and 
#     the name of a famous person you admire. 

# Submission Instructions: Export your plots as images from steps 2, 4, and 6. 
# Save them as lastname1, lastname2 and lastname3 and save your R script as 
# lastnamelab5. Attach all four of your files for grading. 
