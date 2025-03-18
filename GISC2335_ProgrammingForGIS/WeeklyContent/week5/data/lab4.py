# Crystal Hollis
# GISC 2335 Programming for GIS
# Exercise 4 Learning Python Language Fundamentals
# Date: 3/18/2025

# WORK WITH NUMBERS
# 1. Start Visual Studio Code

# 2. Activate Interactive Interpreter. In the terminal, type: python or py
# Type the code and enter without the >>>: >>> 12 + 17
12 + 17  
# Output: 29

# 3. Run code: >>> 10 / 3
10 / 3
# Output: 3.3333333333333335
# The 5 indicates it reached the limit of decimal places.

# 4. Run code: >>> 10 / 5
10 / 5
# Output: 2.0
# Division results in float

# 5. Exponents. Run code: >>> 2 ** 5
2 ** 5
# Output: 32

# 6. Floor Division Operators. Run code: >>> 10 // 3
10 // 3
# Output: 3 

# WORK WITH STRINGS
# 1. Run code: >>> print("Hello World")
print("Hello World")
# Output: Hello World
# String of characters. Make consistent use of '' and "" marks

# 2. Run code: >>> print('Let's go!')
print('Let's go!'')
# Results in a syntax error (use "" instead)

# 3. Run code: >>> print("Let's go!")
# Output: Let's go!

# 4. Run code: >>> z = "Alphabet Soup"
#              >>> print(z[7])
z = "Alphabet Soup"
print(z[7])
# Output: t
# Letter t from Alphabet. Letter A is at index 0
# Indexing

# 5. Run code: >>> print(z[0])
print(z[0])
# Output: A
# Letter A from Alphabet

# 6. Run code: >>> print(z[-1])
print(z[-1])
# Output: p
# Letter p from soup. Slicing

# 7. Run code: >>> print(z[0:8])
print(z[0:8])
# Output: Alphabet
# Returns index 0 to index 8

# 8. Run code: >>> name = "Geographic Information Systems"
#              >>> name.find ("Info")
name = "Geographic Information Systems"
name.find ("Info")
# Output: 11
# 11 is index number of letter I. Spaces counted as characters

# WORK WITH VARIABLES
# 1. Run code: >>> x = 12
#              >>> print(x)
x = 12 # Assignment
print(x)
# Output: 12

# 2. Run code: >>> x = 12
#              >>> y = x / 4
#              >>> print(y)
x = 12
y = x / 4
print(y)
# Output: 3.0
# Variables store different data types like numbers, strings,
# lists, tuples, dictionaries, files, etc.

# 3. Run code: >>> k = 'This is a string'
#              >>> print(k)
k = 'This is a string'
print(k)
# Output: This is a string

# WORK WITH LISTS
# 1. Run code: >>> w = ["Apple", "Banana", "Cantaloupe", "Durian"]
#              >>> print(w)
w = ["Apple", "Banana", "Cantaloupe", "Durian"]
print(w)

# 2. Run code: >>> print(w[0])
print(w[0])
# Output: Apple
# Indexing

# 3. Run code: >>> print(w[-1])
print(w[-1])
# Output: Durian

#4. Run code: >>> print(w[1:-1])
print(w[1:-1])
# Output: ['Banana', 'Cantaloupe']
# Elements from index 1 up to but not including -1

# USE FUNCTIONS
# Standard functions complete list dir(_builtins_)
# 1. Run code: >>> d = pow (2, 3)
#              >>> print(d)
d = pow (2, 3)
print(d)
# Output: 8
# Power function pow () instead of exponential operator

# 2. Run code: >>> print(dir(__builtins__))
print(dir(__builtins__))
# This outputs the list of standard functions

# 3. Run code: >>> e = abs(-12.729)
#              >>> print(e)
e = abs(-12.729)
print(e)
# Outputs: 12.729

# 4. Enter: >>> type(
# Syntax pop-up

# 5. Run code: >>> type(123)
type(123)
# Output: <class 'int'>
# Input value's type is an integer

# 6. Run code: >>> type(1.23)
type(1.23)
# Output: <class 'float'>
# Input value's type is a floating-point number

# 7. Run code: >>> type("GIS")
type("GIS")
# Output: <class 'str'>
# Input value's type is a string

# 8. Enter: >>> round(
# Syntax pop-up, contianing function's parameters: number and ndigits
# ndigits can be set to None
# (number, ndigits=None)
# Round a number to a given precision in decimal digits

# 9. Run code: >>> round(1.234567, 4)
round(1.234567, 4)
# Output: 1.2346
# ndigits rounds number to specified number of decimals

# 10. Run code: >>> round(1.234567)
round(1.234567)
# Output: 1
# Without ndigits, number rounded to nearest integer

# USE METHODS
# 1. Run code: >>> topic = "Geographic Information Systems"
#              >>> topic.count("i")
topic = "Geographic Information Systems"
topic.count("i")
# Output: 2 because that's how many lower case i are in the input string
# Case sensitive

# 2. Run code: >>> topic.split(" ")
topic.split(" ")
# Output: ['Geographic', 'Information', 'Systems']
# splits the string

# 3. Run code:
# >>> path = "C:/data/part1/final"
# >>> pathlist = path.split("/")
# >>> lastpath = pathlist[-1]
# >>> print(lastpath)
path = "C:/data/part1/final"
pathlist = path.split("/")
lastpath = pathlist[-1]
print(lastpath)
# Output: final

# 4. Run code: 
# >>> mylist = ["A", "B", "C"]
# >>> mylist.append("D")
# >>> print(mylist)
mylist = ["A", "B", "C"]
mylist.append("D")
print(mylist)
# Output: ['A', 'B', 'C', 'D']

# USE MODULES
# 1. Run the following code:
# >>> import math
# >>> h = math.floor (7.89)
# >>> print(h)
import math
h = math.floor (7.89)
print(h)
# Output: 7

# 2. Run the following code:
# >>> print(dir(math))
print(dir(math))
# Outputs list of all functions

# 3. Run the following code:
# >>> print(math.radians.__doc__)
print(math.radians.__doc__)
# Output: Convert angle x from degrees to radians.

# 4-6. Locate complete list of modules in Python manuals
# In IDLE, click Help > Python Docs.
# At docs.python.org/3.11/
# i.e. random module > uniform() function

# 7. Run the following code:
# >>> import random
# >>> j = random.uniform(0, 100)
# >>> print(j)
import random
j = random.uniform(0, 100)
print(j)
# Output is a random float between 1 and 100