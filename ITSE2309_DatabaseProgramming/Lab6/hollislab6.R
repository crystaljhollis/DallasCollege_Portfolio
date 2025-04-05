# Name: Crystal Hollis | Favorite Holiday: Halloween
# Class: ITSE 2300.82700 Database Programming
# Lab 6 Cleaning and Retrieving Data
# =============================================================================
# Dataset Files: 
# ramen-ratings.csv, in ~/data/ramen-ratings.csv
# avocado.csv, in ~/data/avocado.csv

# =============================================================================
# LAB 6 INSTRUCTIONS
# In this lab you will clean two data files. To get started:

# 1. Insert a comment with your name and your favorite holiday.
# 2. You will need to load the library "tidyverse" in order to complete this.
library(tidyverse)

# 3. You should also make sure that avocados.csv and ramen.csv are both in your 
#    working directories. [✔] 
# Confirming Directory:
# Current Directory
getwd()
# Set Directory:
# Copy and paste filepath
setwd("/Users/magnamediaartsllc/GitHub/DallasCollege_Portfolio/ITSE2309_DatabaseProgramming/Lab6/data") 
# Verify Current Directory
getwd()

# =============================================================================
# Clean the Ramen Data using the attached file ramen-ratings.csv
# 1.	Read the data from the CSV file into a tibble and display it.
ramen <- read_csv("ramen-ratings.csv")
view(ramen) # Opens in RStudio
# Dataframe should be visible in Environment Window
# Environment Window: ramen | 2577 obs. of 5 variables

# 2.	Rename the Stars column to Rating.
ramen <- ramen %>% rename(Rating = Stars)
# Environment Window: Should show "Rating" column

# 3.	Convert the Style column to the factor type.
ramen$Style <- as.factor(ramen$Style)
# Environment Window: Style should have "Factor w/ 7 levels" 

# 4.	Drop the Country column. [✔]
ramen <- ramen %>% select(-Country)
# Environment Window: should show 4 variables. Country is removed.

# 5.	Rename the Brand column to Company and the Variety column to Product.
ramen <- ramen %>% rename(Company = Brand, Product = Variety)
# Environment Window: Brand changed to Company, Variety changed to Product.

# 6.	Display the tibble to make sure your code worked correctly.
#     Also, make a note of the number of rows in the tibble.
print(ramen)                            
# Outputs: A tibble: 2, 577 × 6
original_row_count <- nrow(ramen) 
# Environmental Window: Values > original_row_count | 2577L
cat("Original row count:", original_row_count, "\n") 
# Output: Original row count: 2577 
# Used cat() for cleaner output

# 7. Use the duplicated() and filter() functions to display all duplicate rows.
duplicates <- ramen %>% filter(duplicated(.))
# Environment Window: 6 obs. of 4 variables
print(duplicates)
# Output:
# # A tibble: 6 × 4

# 8. Drop all duplicate rows. Then, display the tibble to get a count of the 
#    number of rows, and compare that with the original number of rows to 
#    see how many were dropped.
ramen <- ramen %>% distinct()
# Environmental Window: ramen | 2571 obs. o 4 variables
new_row_count <- nrow(ramen)
# Environmental Window: Values > new_row_count | 2571L
cat("New row count:", new_row_count, "\n")
# Output: New row count: 2571
cat("Rows dropped:", original_row_count - new_row_count, "\n")
# Output: Rows dropped: 6

# 9.	Display all rows that have missing values.
missing <- ramen %>% filter(if_any(everything(), is.na))
# Environment Window: created missing. 2 obs. of 4 variables
print(missing)
# Output: A tibble: 2 × 4
# These show missing values in the "Style" column

# 10.	Drop any rows that have missing values.
ramen <- ramen %>% drop_na()
# This removed all rows with NA in the "Style" column.
# Environment Window: ramen is now 2569 obs. of 4 variables

# 11.	Display the tibble to make sure your code worked correctly.
print(ramen)
# A tibble: 2,569 × 4
# All rows with missing values were successfully removed

# =============================================================================
# Clean the Avocado Data using the attached avocado.csv file
# 1.Read the data from the CSV file in a tibble and display first five rows.
avocado <- read_csv("avocado.csv")
# Environment Window: avocado | 18249 obs. of 10 variables
print(head(avocado, 5))
# Displayed the first 5 rows as intended

# 2.Use the str() function to view column names and data types for the table.
str(avocado)
# Outputs a special tibble to view column names and data types

# 3.	Display the value counts for the region column
#     note that one of the regions is TotalUS.
avocado %>% count(region)
# Outputs a tibble: 54 x 2

# 4.	Drop the rows that have a region of TotalUS.
avocado <- avocado %>% filter(region != "TotalUS")
# Environment Window: avocado | 17911 obs. of 10 variables

# 5.	Check to see if any of the rows have missing values.
avocado %>% filter(if_any(everything(), is.na))
# Output:
# # A tibble: 0 × 10
# ℹ 10 variables: Date <chr>, AveragePrice <dbl>, TotalVolume <dbl>, TotalBags <dbl>,
#   SmallBags <dbl>, LargeBags <dbl>, XLargeBags <dbl>, type <chr>, year <dbl>,
#   region <chr>
# There are no rows with missing values.

# 6.	Rename the type, year, and region columns to Type, Year, and Region.
avocado <- avocado %>% rename(Type = type, Year = year, Region = region)
# Environment Window: The columns were updated correctly

# 7.	Convert the Date column to the Date type and the Type column to the 
#     factor type.
avocado$Date <- as.Date(avocado$Date, format = "%m/%d/%Y")
avocado$Type <- as.factor(avocado$Type)

# 8.	Display the tibble to make sure your code worked correctly.
print(avocado)

# =============================================================================
# 9.  	Save your R script as lastnamelab6 and submit for grading. 
# End of Script
