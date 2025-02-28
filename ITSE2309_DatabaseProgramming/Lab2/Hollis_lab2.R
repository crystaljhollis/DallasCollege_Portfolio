# Crystal Hollis
# ITSE 2309 Database Programming Lab 2

# Create a vector named Ones that contains the numbers from 1 to 5.
# In this script create a vector named Twos that contains the numbers from 
# 2 to 10 counting by 2 like this: Twos <- c(seq(from = 2, to = 10, by = 2))
# Create three more vectors, named Threes, Fours, and Fives. 
# Vector Threes should count by threes and include 5 values. 
# Vector Fours should count by fours and contain five numbers. 
# Vector Fives should count by fives and contain five numbers.
Ones <- 1:5
Twos <- seq(2, 10, by=2)
Threes <- seq(3, 15, by=3)
Fours <- seq(4, 20, by=4)
Fives <- seq(5, 25, by=5)

#Create a data frame named times_table that combines your 5 vectors. 
# Include a name for each column using this naming convention replacing 
# Initials with your initials.
times_table <- data.frame(
  CH_One = Ones,
  CH_Two = Twos,
  CH_Three = Threes,
  CH_Four = Fours,
  CH_Five = Fives
)

#Create another vector named Sixes. This vector should contain 5 values 
# beginning at 6 and counting by 6.
Sixes <- seq(6, 30, by=6)

# Use the rbind() function to add Sixes to your times_table data frame. 
# Make sure you have a name for the new column that follows the naming 
# convention in step 6.
rbind(times_table, Sixes)

# Use the cbind() function to add an additional column to your times_table 
# data frame using the Sixes vector, making sure to follow the column naming 
# convention from step 7 .
CH_Six <- Sixes
times_table <- cbind(times_table, CH_Six)
print(times_table)

# Compose 4 separate R commands that look for the following in your 
# times_table data frame.

#   1. One command that looks for row 2 using the data frame index.
row_2 <- times_table[2, ]
print(row_2)

#    2. One command that looks for rows 2, 3, and  4 using the data frame index.
rows_2thru4 <- times_table[2:4, ]
print(rows_2thru4)


#    3. One command that looks for Initials_Threes by it’s column name.
col_Threes <- times_table$CH_Three
print(col_Threes)

#    4. One command that looks for all rows in the data frame but only the 
#     first 3 columns.
subset_3_cols <- times_table[, 1:3]
print(subset_3_cols)

#End


