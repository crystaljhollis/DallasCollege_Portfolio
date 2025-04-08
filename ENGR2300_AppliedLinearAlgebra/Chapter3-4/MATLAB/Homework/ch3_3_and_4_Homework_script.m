% Crystal Hollis
% ENGR 2300 Applied Linear Algebra
% A6 Determinants Chapters 3.3 and 3.4

% Problem 7: Find the volume of the tetrahedron having the given vertices:
% p = [5; -5; 1]; q = [3; -2; 4]; r = [1; 1; 1]; s = [0; 0; 1];

% Enter the points as column vectors 
p = [5; -5; 1];
q = [3; -2; 4];
r = [1; 1; 1];
s = [0; 0; 1];

% Form the difference vectors from one vertex, P. 
% This gives three vectors that define the edges of the 
% tetrahedron from P.
PQ = q - p;
PR = r - p;
PS = s - p;

% Construct the 3×3 matrix whose columns are these difference vectors:
% M = [Q - P R - P S - P]. 
M7 = [PQ, PR, PS];

% Compute the determinant of that matrix:
d = det(M7);

% Compute the volume, which is 1/6 of the absolute value of that
% determinant
volume = abs(d) / 6
disp('cubic units')

%%

% Problem 8: Determine whether the points are coplanar.
% P1 = [1; -7;  9]; P2 = [-1; -7;  9]; P3 = [1; -7; -9]; P4 = [-1; -7; -9];

% Enter the points as column vectors:
P1 = [1; -7;  9];
P2 = [-1; -7;  9];
P3 = [1; -7; -9];
P4 = [-1; -7; -9];

% Form the difference vectors from P1:
v1 = P2 - P1;   % vector P1->P2
v2 = P3 - P1;   % vector P1->P3
v3 = P4 - P1;   % vector P1->P4

% Construct a 3x3 matrix using these vectors as columns:
M8 = [v1, v2, v3];

% Compute the determinant:
d = det(M8);
fprintf('Determinant = %.4f\n', d);

% Interpret the result:
% If d == 0 (or extremely close to zero within floating-point tolerance)
% the points are coplanar. Otherwise, not coplanar.
% Since det(M) = 0, the four points are coplanar

%%

% Problem 10: Find the adjoint of the matrix A. Then use the adjoint to 
% find the inverse of A (if possible). 
% (If not possible / Singular, enter IMPOSSIBLE.)
% A = [
%    -6  -3  -5
%     2   4   3
%     0   1  -1]

% Enter matrix A:
A = [
    -6  -3  -5
     2   4   3
     0   1  -1
];


% Compute the determinant:
dA = det(A);
fprintf('det(A) = %f\n', dA);

% Check if det(A) = 0
if abs(dA) < 1e-12
    disp('IMPOSSIBLE (A is singular)');
else
    % If nonzero, we can proceed
    invA = inv(A);
    % Then the adjoint is det(A)*inv(A)
    adjA = dA * invA;
    disp('adj(A) =');
    disp(adjA);
    
    disp('A^-1 =');
    disp(invA);
end

% Interpret the results: if IMPOSSIBLE (A is singular), then
% det(A) = 0 and there is no inverse.
% Otherwise, there are numeric matrices for adj(A) and inverse of A.

%%
% Problem 12: Use the fact that |cA| = cn|A| to evaluate the 
% determinant of the n × n matrix.
% A = [9 12; 3 -6];  this is a 2x2 matrix

A12 = [9 12; 3 -6];
[m, n] = size(A12);
disp([m, n])  % should be [2, 2]

% STEP 1: Factor out the greatest common divisor.
% By hand, the greatest common divisor is 3
% Dimension n = 2
% Reduced matrix  is A / c
c12 = 3;    % greatest common divisor
B12 = A12 / c12;
disp(B12)

% STEP 2: Find the determinant of the matrix found in Step 1.
detB12 = det(B12);
fprintf('det(B12) = %.4f\n', detB12);

% STEP 3: Find the determinant of the original matrix.
n = 2;   % because A is 2x2
detA12_fromFactor = (c12^n) * detB12;
fprintf('det(A12) via factor-out method = %.4f\n', detA12_fromFactor);

% Verify by directly computing det(A) with built-in function
detA12_direct = det(A12);
fprintf('det(A12) direct = %.4f\n', detA12_direct);
