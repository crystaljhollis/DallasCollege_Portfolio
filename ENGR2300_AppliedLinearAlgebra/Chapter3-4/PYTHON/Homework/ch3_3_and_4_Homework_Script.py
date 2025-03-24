# Crystal Hollis
# ENGR 2300 Applied Linear Algebra
# Homework 6 Chapters 3.3 and 3.4

# Import libraries
from sympy import symbols, Matrix, solve, Eq, det

# Problem 3: Find the value of k such that A is singular.
#     [0, k, 1],
#     [k, 1, k],
#     [1, k, 0]

# Step 1: Define symbol
k = symbols('k')

# Step 2: Define matrix A with symbolic k
A3 = Matrix([
    [0, k, 1],
    [k, 1, k],
    [1, k, 0]
])

# Step 3: Compute determinant
det_A3 = A3.det()

# Step 4: Solve equation det(A) = 0
solutions = solve(Eq(det_A3, 0), k)
print(solutions) # output: [-sqrt(2)/2, sqrt(2)/2]
# Answer: k = -sqrt(2)/2, sqrt(2)/2

# Problem 5: Find |A|, |B|, AB, and |AB|. Then verify that |A||B| = |AB|.
# A =
#     [-1,  2, 1],
#     [ 1,  0, 1],
#     [ 0,  1, 0]
#
# B =
#     [-1,  0,  0],
#     [ 0,  2,  0],
#     [ 0,  0,  5]

# Define Matrices A and B:
A = Matrix([
    [-1,  2, 1],
    [ 1,  0, 1],
    [ 0,  1, 0]
])

B = Matrix([
    [-1,  0,  0],
    [ 0,  2,  0],
    [ 0,  0,  5]
])

# Compute determinants of A and B:
det_A = A.det()
det_B = B.det()
print("det(A) =", det_A)
print("det(B) =", det_B)

# Multiply AB and compute its determinant:
AB = A * B
print("AB =")
print(AB)
det_AB = AB.det()
print("det(AB) =", det_AB)

# Verify
print("det(A)*det(B) =", det_A * det_B)
print("Are they equal?", det_A * det_B == det_AB)

# Problem 6: Use a determinant to decide whether the matrix is singular or nonsingular.
# A =
#     [0.9,  0.3, -0.5,  0.1],
#     [-1.2, 0.3,  0.6,  0  ],
#     [0.6, -0.7,  0.1,  0  ],
#     [0.6, -0.3,  0.2,  0  ]

# import libraries
import numpy as np

# define Matrix A using numpy
A6 = np.array([
    [0.9,  0.3, -0.5,  0.1],
    [-1.2, 0.3,  0.6,  0  ],
    [0.6, -0.7,  0.1,  0  ],
    [0.6, -0.3,  0.2,  0  ]
])

# Compute Determinant of A using numpy
det_A6 = np.linalg.det(A6)
print("det(A6) =", det_A6)


# Interpret the results: If det_A is exactly zero (or extremely close to zero) the matrix is singular.
# Otherwise, the matrix is nonsingular.
tolerance = 1e-12
if abs(det_A6) < tolerance:
    print("Matrix A6 is SINGULAR")
else:
    print("Matrix A6 is NONSINGULAR")

# Problem 11: Use Cramer's Rule to solve (if possible) the system of linear equations. (If not possible, enter IMPOSSIBLE.)
# A11 =
#     [4,  -2,  3],
#     [2,   2,  5],
#     [8,  -5, -2]
# Constant Terms = [-5, 5, 8]

# Library already imported:
# import sympy
# from sympy import Matrix

# Define the coefficient Matrix A and the constant vector b:
A11 = Matrix([
    [4,  -2,  3],
    [2,   2,  5],
    [8,  -5, -2]
])

b11 = Matrix([-5, 5, 8])

# Compute the determinant of A:
detA11 = A11.det()
print("det(A11) =", detA11)

# Form the matrics A_x, A_y, A_z by replacing one column at a time with b:
# A_x: replace the 1st column of A with b
A11_x = A11.copy()
A11_x[:,0] = b11
detA11_x = A11_x.det()

# A_y: replace the 2nd column of A with b
A11_y = A11.copy()
A11_y[:,1] = b11
detA11_y = A11_y.det()

# A_z: replace the 3rd column of A with b
A11_z = A11.copy()
A11_z[:,2] = b11
detA11_z = A11_z.det()

# Check if det(A) = 0. If zero, the system is not uniquely solvable by Cramer's Rule
if detA11 == 0:
    print("IMPOSSIBLE: System is not uniquely solvable (A is singular).")
else:
    x = detA11_x / detA11
    y = detA11_y / detA11
    z = detA11_z / detA11
    print(f"x = {x}, y = {y}, z = {z}")

# Interpret the result:
# If det(A) ≠ 0, you get unique (x, y, z).
# If det(A) = 0, you must answer “IMPOSSIBLE”
# (or the system might have infinitely many or no solutions, but Cramer’s Rule can’t solve it).
