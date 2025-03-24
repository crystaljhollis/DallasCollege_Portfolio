% Crystal Hollis
% ID 1960743
% ENGR 2300 Applied Linear Algebra
% Section 82701
% Spring 2025 MATLAB Project
% Date: 3/23/2025
disp('Crystal Hollis (1960743)');
disp('ENGR 2300-82701 Applied Linear Algebra');
disp('Spring 2025 MATLAB Project 3-23-2025');
disp(' ');
disp(' ');

%% Problem 1
% Use MATLAB command A/B to solve the linear system:
% 16x − 120y + 240z − 140w = −4
% −120x + 1200y − 2700z + 1680w = 60
% 240x − 2700y + 6480z − 4200w = −180
% −140x + 1680y − 4200z + 2800w = 140
disp('Problem 1: Use MATLAB command A/B to solve the linear system.');
disp('16x − 120y + 240z − 140w = −4');
disp('−120x + 1200y − 2700z + 1680w = 60');
disp('240x − 2700y + 6480z − 4200w = −180');
disp('−140x + 1680y − 4200z + 2800w = 140');

% Define the coefficient matrix A1
A1 = [
    16   -120   240  -140
   -120   1200 -2700  1680
    240  -2700  6480 -4200
   -140   1680 -4200  2800
];
disp(' ');
disp('Coefficient matrix A1 =');
disp('[16 −120 240 −140');
disp('−120 1200 −2700 1680');
disp('240 −2700 6480 −4200');
disp('−140 1680 −4200 2800]');

% Define the Constant Vector B1
B1 = [
   -4
    60
  -180
   140
];
disp(' ');
disp('Constant Vector B1 =');
disp('[-4');
disp(' 60');
disp(' −180');
disp('140]');

% MATLAB command A\B
X1 = A1 \ B1;

% Display Solution
disp(' ');
disp('Problem 1 Solution: (x, y, z, w) =');
disp(X1); 
% Output should be Solution (x, y, z, w) = (1, 1, 1, 1)

%% Problem 2
% Let A be the coefficient matrix and B the right-hand side of the linear
% system
% 3x + 3y + 12z = 18
% x + y + 4z = 6
% 2x + 5y + 20z = 30
% -x + 2y + 8z = 12
disp(' ');
disp('Problem 2: Let A be the coefficient matrix and B the right-hand side of the linear system');
disp('3x + 3y + 12z = 18');
disp('x + y + 4z = 6');
disp('2x + 5y + 20z = 30');
disp('-x + 2y + 8z = 12');

% Define the coefficient matrix A2
A2 = [
    3   3   12
    1   1    4
    2   5   20
   -1   2    8
];

disp(' ');
disp('Coefficient matrix A2 =');
disp('[3 3 12');
disp('1  1 4 ');
disp('2  5 20');
disp('−1 2 8]');

% Define the Constant Vector B2
B2 = [
   18
    6
   30
   12
];
disp(' ');
disp('Constant Vector B2 =');
disp('[18');
disp(' 6');
disp(' 30');
disp('12]');

% MATLAB command C2 = [A2 B2]
C2 = [A2 B2];
disp(' ');
disp('MATLAB command C2 = [A2 B2]');

% Solve the system using rref
R2 = rref(C2);
disp(' ');
disp('Solve the system using rref');
disp('R2 = rref(C2);')
disp(' ');
disp('Problem 2 Solution:');
disp('Reduced row-echelon form of [A2 B2]:');
disp(R2); 
% Output should be Reduced row-echelon form of [A2 B2]:
% [1 0 0 0
% 0 1 4 6
% 0 0 0 0
% 0 0 0 0]

%% Problem 3
% Use MATLAB to find a sixth-degree polynomial that fits the points: 
% (0,0), (-1, 4.5), (-2, 133), (-3, 1225.5), (1, -0.5), (2, 3), (3, 250.5) 
disp(' '); 
disp('Problem 3: Use MATLAB to find a sixth-degree polynomial that fits the points:');
disp('(0,0), (-1, 4.5), (-2, 133), (-3, 1225.5), (1, -0.5), (2, 3), (3, 250.5)'); 

% Define the x and y data vectors x3 = [0, -1, -2, -3, 1, 2, 3]; y3 = [0, 4.5, 133, 1225.5, -0.5, 3, 250.5];
x3 = [0, -1, -2, -3, 1, 2, 3];
y3 = [0, 4.5, 133, 1225.5, -0.5, 3, 250.5];
disp(' '); 
disp('x data vectors = [0, -1, -2, -3, 1, 2, 3] '); 
disp('y data vectors = [0, 4.5, 133, 1225.5, -0.5, 3, 250.5] ');  

% Use polyfit to compute the polynomial coefficients (degree 6) p3 = polyfit(x3, y3, 6); disp('Polynomial coefficients (highest degree first):'); disp(p3);
p3 = polyfit(x3, y3, 6);
disp(' '); 
disp('Polynomial coefficients (highest degree first):'); 
disp(p3);
% Output should be 
% Polynomial coefficients (highest degree first):
% Columns 1 through 4: 1.0000   -2.0000    0.0000   -0.0000
% Columns 5 through 7: 1.0000   -0.5000    0.0000

%% Problem 4
% Enter the matrices A and B:
% A = [ 0 -4 5; 3 1 -2; 2 1 4 ] 
% B = [ -5 6 7; 0 -1 2; 4 0 -3 ] 
A4 = [ 0 -4 5; 3 1 -2; 2 1 4 ];
B4 = [ -5 6 7; 0 -1 2; 4 0 -3 ];
disp(' '); 
disp('Problem 4: Enter the matrices A and B: ');
disp('A4 = [ 0 -4 5; 3 1 -2; 2 1 4 ] ');
disp('B4 = [ -5 6 7; 0 -1 2; 4 0 -3 ] '); 

% (a) Compute A + B AB_sum = A4 + B4; disp('A + B ='); disp(AB_sum);
AB_sum = A4 + B4;
disp(' '); 
disp('Problem 4a: Compute A4 + B4');
disp('A + B');
disp('Problem 4a Solution:')
disp(AB_sum);

% (b) Compute 5B + 2A
expr_b = 5 * B4 + 2 * A4; 
disp(' '); 
disp('Problem 4b Compute 5B + 2A');
disp('5B + 2A');
disp('Problem 4b Solution:'); 
disp(expr_b);

% (c) Compute BA (matrix multiplication B * A)
BA = B4 * A4;

disp(' '); 
disp('Problem 4c Compute BA '); 
disp('B * A');
disp('Problem 4c Solution:'); 
disp(BA);

% (d) Compute AB (matrix multiplication A * B)
AB = A4 * B4;
disp(' '); 
disp('Problem 4d Compute AB '); 
disp('A * B');
disp('Problem 4d Solution:'); 
disp(AB);

%% Problem 5 
% Enter the matrices: 
% A = [1 2 3 4; 2 3 4 5; 3 4 5 6; 4 5 6 7] 
% B = [ 4 -6 3 5; 0 -3 -6 8; 3 5 0 7; -1 0 7 9 ] 
% Also, define C = [16 -1 4 -1; -3 12 -7 8; 4 -5 0 0; -14 3 2 8]
A5 = [ 1 2 3 4; 2 3 4 5; 3 4 5 6; 4 5 6 7 ];
B5 = [ 4 -6 3 5; 0 -3 -6 8; 3 5 0 7; -1 0 7 9 ];
C5 = [ 16 -1 4 -1; -3 12 -7 8; 4 -5 0 0; -14 3 2 8 ];
disp(' '); 
disp('Problem 5: Enter the matrices:');
disp('A5 = [ 1 2 3 4; 2 3 4 5; 3 4 5 6; 4 5 6 7 ] ');
disp('B5 = [ 4 -6 3 5; 0 -3 -6 8; 3 5 0 7; -1 0 7 9 ]');
disp('C5 = [ 16 -1 4 -1; -3 12 -7 8; 4 -5 0 0; -14 3 2 8 ]');

% (a) Compute 3*(BC), B(3C), and (3B)C 
disp(' '); 
disp('Problem 5a: Find 3(BC), B(3C), (3B)C. What do you observe?');
expr1 = 3 * (B5 * C5);
disp('3(BC) = '); 
disp(expr1);
expr2 = B5 * (3 * C5); 
disp('B(3C) = '); 
disp(expr2);
expr3 = (3 * B5) * C5;
disp('(3B)C = '); 
disp(expr3);
disp('I observe that all three expressions are equal.');

% (b) Compute AB + AC and A*(B+C) 
% Note: Here, interpret “AC” as A times C where C is the matrix C5.
expr4 = A5 * B5 + A5 * C5; 
expr5 = A5 * (B5 + C5); 
disp(' '); 
disp('Problem 5b: Compute AB + AC and A*(B+C)'); 
disp('AB + AC ='); 
disp(expr4); 
disp('A*(B + C) ='); 
disp(expr5); 
disp('I observe that the two expressions are equal (distributive property).');

%% Problem 6 
% Let A = [1, 1/3; 0, 1/5]. Find A^2, A^3, A^8 and describe A^n for large n. 
disp(' '); 
disp('Problem 6: Let A = [1, 1/3; 0, 1/5]. Find A^2, A^3, A^8 and describe A^n for large n. '); 
A6 = [1, 1/3; 0, 1/5]; 
A6_2 = A6^2; 
A6_3 = A6^3; 
A6_8 = A6^8; 
disp('A^2 ='); 
disp(A6_2); 
disp('A^3 ='); 
disp(A6_3); 
disp('A^8 ='); 
disp(A6_8); 
disp('I observe that as n increases, the (2,2) entry (1/5)^n decays toward zero,'); 
disp('and A^n approaches a matrix with the (1,1) entry equal to 1 and the (1,2) entry approaching a limit.');

%% Problem 7 
% Let A and B be the 3x3 matrices: 
% A = [2, 4, 5/2; -3/4, 2, 1/4; 1/4, 1/2, 2] 
% B = [1, -1/2, 3/4; 3/2, 1/2, -2; 1/4, 1, 1/2] 
disp(' '); 
disp('Problem 7: Let A and B be the 3x3 matrices:');
disp('A = [2, 4, 5/2; -3/4, 2, 1/4; 1/4, 1/2, 2] '); 
disp('B = [1, -1/2, 3/4; 3/2, 1/2, -2; 1/4, 1, 1/2]  '); 
A7 = [2, 4, 5/2; -3/4, 2, 1/4; 1/4, 1/2, 2];
B7 = [1, -1/2, 3/4; 3/2, 1/2, -2; 1/4, 1, 1/2];

% (a) Compute B^(-1)A^(-1), (AB)^(-1), (BA)^(-1) 
invB7 = inv(B7); 
invA7 = inv(A7); 
expr7a = invB7 * invA7; 
expr7b = inv(A7 * B7); 
expr7c = inv(B7 * A7); 
disp(' '); 
disp('Problem 7a: Compute B^(-1)A^(-1), (AB)^(-1), (BA)^(-1):'); 
disp('B^(-1)A^(-1) ='); 
disp(expr7a); 
disp('(AB)^(-1) ='); 
disp(expr7b); 
disp('(BA)^(-1) ='); 
disp(expr7c); 
disp('I observe that B^(-1)A^(-1) equals (AB)^(-1) and also equals (B*A)^(-1) if A and B commute.');

% (b) Compute (A^(-1))T and (AT)^(-1) 
invA7_transpose = (invA7)'; 
transposeA7_inv = inv(A7'); 
disp(' ');
disp('Problem 7b: Compute (A^(-1))transpose and (A transpose)^(-1)'); 
disp('(A^(-1))'' ='); 
disp(invA7_transpose); 
disp('(A'')^(-1) ='); 
disp(transposeA7_inv); 
disp('I observe that (A^(-1))transpose equals (A transpose)^(-1).');


%% Problem 8 
% Consider the matrices: 
% A8 = [2, 0, 1; 1, -1, 2; 3, 1, 2] 
% B8 = [2, -1, 4; 0, -1, 3; 3, -2, 1] 
disp(' '); 
disp('Problem 8: Consider the matrices: ');
disp('A8 = [2, 0, 1; 1, -1, 2; 3, 1, 2] ');
disp('B8 = [2, -1, 4; 0, -1, 3; 3, -2, 1] ');
A8 = [2, 0, 1; 1, -1, 2; 3, 1, 2]; 
B8 = [2, -1, 4; 0, -1, 3; 3, -2, 1];
detA8 = det(A8); 
detB8 = det(B8); 
detAB = det(A8 * B8); 
detA8T = det(A8'); % A8' is the transpose of A8 
detA8_inv = 1 / detA8; % Should equal det(inv(A8))
disp(' ');
disp('Problem 8a: det(A8)det(B8) = det(AB)'); 
disp('det(A8) ='); 
disp(detA8); 
disp('det(B8) ='); 
disp(detB8); 
disp('det(A)det(B8) ='); 
disp(detA8 * detB8); 
disp('det(AB8) ='); 
disp(detAB); 
disp('Verification of det(A8)det(B8) = det(AB8):'); 
disp(abs(detA8 * detB8 - detAB) < 1e-10);
disp(' ');
disp('Problem 8b: det(A transpose) = det(A):'); 
disp('det(A8T) ='); 
disp(detA8T); 
disp('Verification of det(A transpose) = det(A):'); 
disp(abs(detA8T - detA8) < 1e-10);
disp(' ');
disp('Problem 8c: det(A inverse) = 1/det(A)'); 
invA8 = inv(A8);
detA8_inv_calc = det(invA8); 
disp('det(inv(A)) ='); 
disp(detA8_inv_calc); 
disp('Verification of det(inv(A)) = 1/det(A):'); 
disp(abs(detA8_inv_calc - detA8_inv) < 1e-10);

% End of MATLAB Script