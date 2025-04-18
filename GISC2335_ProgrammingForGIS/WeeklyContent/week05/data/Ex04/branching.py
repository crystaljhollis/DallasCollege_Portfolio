# Crystal Hollis
# GISC 2335 GIS Programming
# 3/18/2025
# Week 5 Lab 4

# WRITE CONDITIONAL STATEMENTS
# 1. In the Python Shell, click File > New File.
# 2. Write the following code to generate a random number between 1 and 6:
# import random
# p = random.randint(1, 6) 
# print(p)
# 3. Save the script as branching.py to the C:\PythonPro\Ex04 folder.
# 4. Run the script to confirm that it works correctly.
# 5. Replace line 3 with the following:
#    if p == 6:
# 6. Write the following line of code following the if statement:
# print("You win!" )
# 8. In the branching.py script, place your pointer at the end of the line 
# of code that reads print("You win!"), and press Enter.
# 9. Press Backspace to remove the indentation.
# 10. For the next lines of code, enter the following:
# else:
#     print("You lose!")
# 11. Save and run the script.
# 12. Above the else statement, insert a line and enter the following code:
# elif p == 5:
#     print("Try again!")
# 13. Run the script a few times until the results include all three conditions.
# 14. Save your branching.py script, and close it.

# CHECK FOR ERRORS
# 4. Open your branching.py script from earlier in the exercise.
# 5. Place your pointer at the end of the third line of code and remove the colon at the end of the if statement:
# if p == 6
# 6. In IDLE, Click Run > Check Module.
# In Visual Studio Code this is Run > Start Debugging
# 7. Correct the syntax error by placing a colon at the end of the if statement.
# 8. Now introduce a different error by placing a typo in the randint() function:
# p = random.randinr(0, 6)
# 9. Check the syntax of your script by clicking Run > Check Module.
# 10. Try running your script.

# End of Exercise 4

import random
p = random.randinr(0, 6)
if p == 6:
    print("You win!")
elif p == 5:
    print("Try again!")
else:
    print("You lose!")


