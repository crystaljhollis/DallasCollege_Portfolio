# Name: Crystal Hollis
# Date: 03/18/2025
# Description: This script demonstrates how to break a loop

# GISC 2335 GIS Programming
# Week 5 Lab 4

# USE LOOP STRUCTURES

# 9. Create a new script, and save it as break_loop.py to the Ex04 folder.
# 10. Write the following code:
# from math import sqrt
# for i in list(range(1000, 0, -1)): 
#     root = sqrt(i)
#     if root == int(root): 
#         print(i)
#         break
# 11. Run the script. The result prints 961.

# COMMENT SCRIPTS
# 1. In the break_loop.py script, place your pointer at the beginning of the code, and press Enter. At the top of the script, type the following lines of code:
# Name: <your name>
# Date: <current date>
# Description: This script demonstrates how to break a loop

# 2. At the end of the line if root == int(root), enter a few spaces and then the following comment:
# This evaluates whether the root is an integer.
# 3. In the break_loop.py script, select and highlight the last three lines of code.
# 4. In IDLE, click Format > Comment Out Region. In Visual Studio Code, comment out region is in Edit > Toggle Line Comment
# 5. In IDLE, To make the code active again, select and highlight the commented lines, and click Format > Uncomment region.
# In Visual Studio Code, just go back to Edit > Toggle Line Comment to remove it

from math import sqrt
for i in list(range(1000, 0, -1)):
    root = sqrt(i)
    if root == int(root):  # This evaluates whether the root is an integer
        print(i)
        break

# 6. Save your break_loop.py script.