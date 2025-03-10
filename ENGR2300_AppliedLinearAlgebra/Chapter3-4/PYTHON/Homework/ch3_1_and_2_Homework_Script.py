# Crystal Hollis
# ENGR 2300 Applied Linear Algebra
# Homework 5 Chapters 3.1 and 3.2

# Import libraries
import numpy as np

# Problem 8: Use elementary row or column operations to find the determinant.
A8 = np.array([[3, -1, -2],
               [2, 1, 3],
               [-6, 2, 4]])
 
det_A8 = np.linalg.det(A8) # computing determinant
print(int(round(det_A8))) # display, rounded up integer
# Answer is 0

# Problem 13: Solve for x.
# [x-10 11][2 x-1] = 0
import sympy as sp
 
# Define the variable x
A13 = sp.Symbol('x')
 
# Define the determinant equation
x = sp.Symbol('x')
A13 = sp.Matrix([
            [x - 10, 11],
            [2, x-1]
    ])
 
# Compute the determinant
det_A13 = A13.det()
 
# Solve for x when the determinant is 0
solutions = sp.solve(det_A13, x)
 
# Print solutions
print(f"Solutions for x: {solutions}")
# Solutions for x: [-1, 12]
