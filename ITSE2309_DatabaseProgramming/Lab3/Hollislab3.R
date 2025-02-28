# Crystal Hollis
# ITSE 2309 Database Programming Lab 3
# 2/9/2025

#CREATE A DATA FRAME
# Create a vector of pirate captain names. You can use any names you like, 
# but make sure you have 5 or more names in your vector. The first vector 
# value should be your first name.
pirate_captains <- c("Crystal", "Monkey D. Luffy", "Buggy", "Kuro", "Arlong")

#Create a second vector of crew sizes. This vector should contain the number 
# of crew members for each captain you named in the previous step. At least 
# one value in the CrewSize vector should be bigger than 5.
CrewSize <- c(10, 13, 26, 5, 12)

# Create a data frame named ships where the first column stores the captain’s 
# name, and the second column stores the crew sizes. Give the first column the 
# name of Captain and the second column the name of CrewSize.
ships <- data.frame(Captain = pirate_captains, CrewSize = CrewSize)

# Display the data frame on the console. It should have 2 columns and 5 rows. 
# The first row’s value in the Captain column should be your name.
print(ships)

# Use the single bracket selector to select the column named CrewSize, (pos 2).
print(ships[ ,2])

# Use the $ selector to select the vector for the column named Captain
print(ships$Captain)

# Use the rbind() function to add a row for another captain and crew size, when 
# you do use a list, not a vector to store the data for the row.
ships <- rbind(ships, data.frame(Captain="Shanks", CrewSize=18))
print(ships)

#FUN WITH LOOPS

#Code a For Loop that loops through all values in the vector for the 
# CrewSize column. Within the loop code a statement that prints each crew 
# size value to the console. Make sure the loop runs properly.  Make sure your 
# values only print once.
for (size in ships$CrewSize) {
  print(size)
}

# Create a vector that is called yourlastname, substituting your last name. 
# The vector should have 5 text values in it. It can be anything you like: 
# sports teams, dog breeds, types of tea, etc.
hollis <- c("Devil Fruit", "Grand Line", "Haki", "One Piece", "Yonko")

# Print the value in the 4th position of vector, using single bracket selector.
print(hollis[4])

# Code a For Loop with an IF statement that prints the third value.
# Copy your code from step 11 and an Else clause that prints the words 
# “Not Third Value”. Your output should look something like this:
# [1] "not the third value"
# [1] "not the third value"
# [1] "Haki"
# [1] "not the third value"
# [1] "not the third value"
for (item in hollis) {
  if (item == hollis[3]) {
    print(item)
  } else {
    print("not the third value")
  }
}

#FUNCTIONS
# Create a custom function that has one argument. The function should be called 
# welcome_message. The function should take one parameter and print a message 
# to the console that uses the parameter and includes some other text. The 
# message can be anything you choose, but it must use the name that is 
# passed to the welcome_message function.  Use the Paste function like we did 
# in lab1 to print your message.  Here’s a hint.
# print( paste("some text", parameter, “some more text”))
# Make sure and test the function.

welcome_message <- function(parameter) {
  print(paste("Hello, welcome", parameter, "to our ship!"))
}
welcome_message("Zoro")

# Create a function called subtract_and_multiply() that accepts two numbers as 
# arguments. Inside the function’s brackets subtract the first number from the 
# second number and store the result in a variable. Also multiply the first 
# number and the second number and store the result in a second variable. 
# Finally print two lines inside the function. The first line should look 
# something like this: 
#     “Secondnumber subtracted from the firstnumber = firstvariable.”
#The second line should look something like this. 
#     “Firstnumber and secondnumber multiplied together = secondvariable.”
# Substitute firstnumber and secondnumber for the values that are passed to 
# the function and substitute firstvariable and secondvariable for 
# the variable values.

subtract_and_multiply <- function(num1, num2) {
  firstvariable <- num2 - num1
  secondvariable <- num1 * num2
  print(paste(num2, "subtracted from", num1, "is", firstvariable))
  print(paste(num1, "multiplied by", num2, "is", secondvariable))
}
subtract_and_multiply(5, 10)

#End



