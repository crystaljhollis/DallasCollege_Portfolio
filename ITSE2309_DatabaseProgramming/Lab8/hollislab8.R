# Name: Crystal Hollis
# Class: ITSE 2300.82700 Database Programming
# Lab 8 More Visualization for the Ramen Data
# =============================================================================
# Dataset Files:  
# ramen-ratings.csv, in ~/data/ramen-ratings.csv

# GitHub: https://github.com/crystaljhollis/DallasCollege_Portfolio/tree/main/ITSE2309_DatabaseProgramming/Lab8
# Copies of the dataset and exported images are in GitHub ~/Lab8
# =============================================================================

# LAB 7 INSTRUCTIONS: More Visualization for the Ramen Data
# =============================================================================
# 1.	Read the data from the CSV file into a tibble and display it. [✔] 

# also importing tidyverse and setting workspace 
library(tidyverse)
# Confirming Directory:
# Current Directory
getwd()
# Set Directory:
# Copy and paste filepath
setwd("/Users/magnamediaartsllc/GitHub/DallasCollege_Portfolio/ITSE2309_DatabaseProgramming/Lab8/data")
# Verify Current Directory
getwd() #should be ~/Lab8/data

ramen <- read_csv("ramen-ratings.csv")
print(ramen)

# Output:
# # A tibble: 2,580 × 7
# `Review #` Brand          Variety                                                     Style Country   Stars `Top Ten`
# <dbl> <chr>          <chr>                                                       <chr> <chr>     <chr> <chr>    
#  1       2580 New Touch      T's Restaurant Tantanmen                                    Cup   Japan     3.75  NA       
#  2       2579 Just Way       Noodles Spicy Hot Sesame Spicy Hot Sesame Guan-miao Noodles Pack  Taiwan    1     NA       
#  3       2578 Nissin         Cup Noodles Chicken Vegetable                               Cup   USA       2.25  NA       
#  4       2577 Wei Lih        GGE Ramen Snack Tomato Flavor                               Pack  Taiwan    2.75  NA       
#  5       2576 Ching's Secret Singapore Curry                                             Pack  India     3.75  NA       
#  6       2575 Samyang Foods  Kimchi song Song Ramen                                      Pack  South Ko… 4.75  NA       
#  7       2574 Acecook        Spice Deli Tantan Men With Cilantro                         Cup   Japan     4     NA       
#  8       2573 Ikeda Shoku    Nabeyaki Kitsune Udon                                       Tray  Japan     3.75  NA       
#  9       2572 Ripe'n'Dry     Hokkaido Soy Sauce Ramen                                    Pack  Japan     0.25  NA       
#  10       2571 KOKA           The Original Spicy Stir-Fried Noodles                       Pack  Singapore 2.5   NA       
# # ℹ 2,570 more rows
# # ℹ Use `print(n = ...)` to see more rows

# =============================================================================
# 2.	Create a tibble named ramen_stats that groups the data by style and 
#     calculates the mean stars and standard deviation for each style. [✔] 
ramen_stats <- ramen %>%
  group_by(Style) %>%
  summarize(
    MeanStars = mean(as.numeric(Stars), na.rm = TRUE), 
    SDStars = sd(as.numeric(Stars), na.rm = TRUE)
  )
print(ramen_stats)

# used as.numeric() to bring about numeric values only. 
# some that are unrated becomes NA

# Output: 
# # A tibble: 8 × 3
# Style MeanStars SDStars
# <chr>     <dbl>   <dbl>
# 1 Bar        5     NA    
# 2 Bowl       3.67   1.06 
# 3 Box        4.29   1.40 
# 4 Can        3.5   NA    
# 5 Cup        3.50   1.03 
# 6 Pack       3.70   0.983
# 7 Tray       3.55   1.10 
# 8 NA         3.38   0.530

# =============================================================================
# 3.	Create a bar plot that displays the mean stars for each style. [✔] 

ggplot(ramen_stats,
       aes(x = Style, y = MeanStars, fill = Style)) + geom_col()

# Outputs Bar Graph with 
# X-axis: Style
# Y-axis: Mean Stars
# Color fill by Style
# exported copy in ~/Lab8/exports/ramenratingsBarPlot1.png

# =============================================================================
# 4.	Add error bars to the bar plot created in the previous step and use the 
#     standard deviation of the stars to determine the length of the error bar.
# [✔] 

ggplot(ramen_stats,
       aes(x = Style, y = MeanStars, fill = Style)) + 
  geom_col() +
  geom_errorbar(aes(ymin = MeanStars - SDStars,
                    ymax = MeanStars + SDStars),
                width = 0.2)
# Output:
# Bar graph with error bars added. 
# A copy is exported in ~/Lab8/exports/ramenratingsBarPlot2_errorBars.png

# =============================================================================
# 5.	Create a plot that displays a map of the world. [✔] 

ggplot(data = map_data("world"),
       aes(x = long, y = lat, group = group)) +
  geom_polygon(fill= "lightgreen", color = "black") +
  coord_quickmap() + 
  theme(
    panel.background = element_rect(fill = "lightblue"),
    plot.background = element_rect(fill = "lightblue"),
    panel.grid = element_blank()
  )

# Output:
# Created a map of the world. Used light green for the countries and black for
# the borders. Used theme() to change the background to light blue. 
# a copy is saved in ~/lab8/exports/mapoftheworld1.png

# =============================================================================
# 6.	Create a tibble named mean_ratings that contains the mean number of stars 
#     for each country.

mean_ratings <- ramen %>%
  group_by(Country) %>%
  summarize(MeanRating = mean(as.numeric(Stars), na.rm = TRUE)) #numeric
print(mean_ratings)

# Output:
# # # A tibble: 38 × 2
# Country    MeanRating
# <chr>           <dbl>
#   1 Australia        3.14
# 2 Bangladesh       3.71
# 3 Brazil           4.35
# 4 Cambodia         4.2 
# 5 Canada           2.24
# 6 China            3.42
# 7 Colombia         3.29
# 8 Dubai            3.58
# 9 Estonia          3.5 
# 10 Fiji             3.88
# # ℹ 28 more rows
# # ℹ Use `print(n = ...)` to see more rows

# =============================================================================
# 7.	Create a scatter plot using the mean_ratings tibble. Using Country as the 
#     x-axis, MeanRating as the y-axis and color = country. 

ggplot(mean_ratings, aes(x = Country, y = MeanRating, color = Country)) + 
  geom_point(size = 3)

# Outputs Scatter Plot
# copy is in ~/Lab8/exports/scatterplot1.png

# =============================================================================
#8.	Improve the appearance of the scatter plot by adding a title. The title 
#   should be your name,  and removing the labels, ticks, and text for the x 
#   and y axes.

#the default colors are difficult to distinguish, but since we know it is 
# in alphabetical order, I decided to use an alternating color pattern.
country_colors <- rep(c("red", "blue", "green", "orange", "purple", "brown", "pink", "black"), 
                      length.out = nrow(mean_ratings))

ggplot(mean_ratings, aes(x = Country, y = MeanRating, color = Country)) + 
  geom_point(size = 3) +
  labs(title = "Crystal Hollis - Average Ramen Ratings per Country (Alphabetical Order)") +
  scale_color_manual(values = country_colors) + # the exact colors are presented in order so they alternate
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

# added context in the title for anyone unfamiliar with this assignment

# Output:
# Scatter plot 
# copy is saved in ~/Lab8/exports/scatterplot2.png

# Optional:
# I wanted to experiment with presenting the MeanRating by Country in the 
# world map:

library(maps) # loading library
world <- map_data("world") # map data
unique(world$region) # I cross referenced Country names used by map_data("world")
# Sarawak will be combined with Malaysia.
# Hong Kong will be combined with China.

mean_ratings$Country[mean_ratings$Country == "Hong Kong"] <- "China"
mean_ratings$Country[mean_ratings$Country == "Sarawak"] <- "Malaysia"

mean_ratings <- mean_ratings %>%
  group_by(Country) %>%
  summarize(MeanRating = mean(as.numeric(MeanRating), na.rm = TRUE))

# Join mean_ratings with map data
world_data <- left_join(world, mean_ratings, by = c("region" = "Country"))

# World Map with highest rating being green and lowest rating being red. 
# Labeled to clarify that the map is average ramen ratings by country it was 
# manufactured from, not by consumer ratings from those countries. 

ggplot(data = world_data, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = MeanRating), color = "black") +
  coord_quickmap() +
  scale_fill_gradientn(
    colors = c("red", "green"),
    values = scales::rescale(c(1.5, 4.0)),
    name = "Mean Stars"
  ) +
  labs(title = "Crystal Hollis – Average Ratings of Ramen by Country of Manufacture") + 
  theme(
    panel.background = element_rect(fill = "lightblue"),
    plot.background = element_rect(fill = "lightblue"),
    panel.grid = element_blank()
  )

# Output:
# Map with unused countries colored gray, mean stars from red (low) to green 
# (high). Black borders.
# A copy is in ~/Lab8/exports/mapoftheworld2.png

# =============================================================================
# END OF INSTRUCTIONS and LAB 8