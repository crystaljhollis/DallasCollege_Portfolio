# Name: Crystal Hollis
# ITSE 2309-82700 Database Programming
# Date: 02/16/2025

# Current Directory
getwd()

# Set Directory
# Copy and paste filepath to where the avocado.csv is located
setwd("/Users/magnamediaartsllc/GitHub/DallasCollege_Portfolio/ITSE2309_DatabaseProgramming/Lab4") 

# Verify Current Directory
getwd()

# Load required library
library(tidyverse)

# 1.	Read the data from the CSV file into a tibble. To do that, you can use the 
#     read_csv() function like this (make sure your copy of avocados.csv is in 
#     your working directory within RStudio, see the lecture notes). 
#     avocados <- read_csv("avocado.csv")
avocados <- read_csv("avocado.csv")

# 2.	Display the tibble on the console.
print(avocados)

# 3.	Summarize all columns with the summary() function.
summary(avocados)

# 4.	Display the first four columns of data with the select() function.
select(avocados, 1:4)

# 5.	Summarize the AveragePrice and TotalVolume columns.
summary(select(avocados, AveragePrice, TotalVolume))

# 6.	Display the first three columns of the last five rows of the data set.
tail(select(avocados, 1:3), 5)

# 7.	Add a new column named EstimatedRevenue that stores the result of 
#     multiplying the TotalVolume and AveragePrice columns. Then, display the 
#     data for these columns to confirm that the column was added and has the 
#     correct values.
avocados <- avocados %>%
  mutate(EstimatedRevenue = TotalVolume * AveragePrice)

# Check if the column was added correctly
select(avocados, TotalVolume, AveragePrice, EstimatedRevenue)

# 8.	Create a tibble named avocados_by_region that’s grouped by region and 
#     type and has a third column that includes the average price for each 
#     group. Then, display the tibble to view its data.
avocados_by_region <- avocados %>%
  group_by(region, type) %>%
  summarize(AveragePrice = mean(AveragePrice, na.rm = TRUE))

# Display the grouped tibble
print(avocados_by_region)

# QUESTIONS
# QUESTION 1.	How many unique regions are there?
length(unique(avocados$region)) # Counts unique regions
# Output:
# [1] 54

# ANSWER: 54 unique regions in the dataset

# QUESTION 2.	What is the average price for each type of avocado (organic and 
#     conventional)? Be sure to include just the type and AveragePrice columns 
#     in the results.
avocados %>%
  group_by(type) %>%
  summarize(AveragePrice = mean(AveragePrice, na.rm = TRUE))
#Output:
# A tibble: 2 × 2
# type            AveragePrice
# 1 conventional          1.16
# 2 organic               1.65

# ANSWER: The average price of organic avocados is $1.65 and the average price 
#         of conventional avocados is $1.16. 

# QUESTION 3.	Which region has the lowest average price for organic avocados? 
#     (Create a tibble that has the correct data. Then, use RStudio to view the 
#     tibble and sort by the AveragePrice and type columns.)
avocados %>%
  filter(type == "organic") %>%
  group_by(region) %>%
  summarize(AveragePrice = mean(AveragePrice, na.rm = TRUE)) %>%
  arrange(AveragePrice) # Sort to find the lowest price
#Output:
# A tibble: 54 × 2
#  region           AveragePrice
#1 Houston                  1.27
#2 DallasFtWorth            1.32
#3 SouthCentral             1.33

# ANSWER: The region with the lowest average price for organic avocados is 
#         Houston.





