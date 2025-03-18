% Crystal Hollis
% ENGR 2300 Applied Linear Algebra
% A5 Determinants Chapters 3.1 and 3.2 

% Problem 6: Find the determinant of the triangular matrix
% A = [-3 0 0; 9 6 0; -3 9 -3]

A = [-3 0 0; 9 6 0; -3 9 -3]; % Matrix
det_A = det(A) % Computing Determinant
disp(det_A) % Display result, should be 54

%% 

% Problem 11: Find the values of λ for which the determinant is zero.
% Enter answers as a comma-separated list.
% A = [λ 9 0; 0 λ+2 3; 0 1 λ]

syms lambda % define matrix symbolically using syms
A11 = [lambda, 9, 0; 0, lambda + 2, 3; 0, 1, lambda];
det_A11 = det(A11); % Compute determinant problem 11
% Output Determinant of A: lambda^3 + 2*lambda^2 - 3*lambda
disp('Determinant of A:')
disp(det_A11)

% Solve for λ when det(A11) = 0
lambda_values = solve(det_A11 == 0, lambda);
disp('Values of lambda:')
disp(lambda_values)
% Output: Values of lambda: -3 0 1
% Answer is λ = -3, 0, 1

%% 

% Problem 12: Find all minors and cofactors of the matrix.
% A = [-3 2 1; 5 4 6; 2 -1 3]

syms A12;
A12 = [-3 2 1; 5 4 6; 2 -1 3];

% Compute Minors - determinants of 2x2 submatrices
Minors = sym(zeros(3,3));
for i = 1:3
    for j = 1:3
        subMatrix = A12;
        subMatrix(i,:) = []; % remove row i
        subMatrix(:,j) = []; % remove column j
        Minors(i,j) = det(subMatrix);
    end
end

% Compute cofactors - minors with sign adjustment
Cofactors = Minors .* (-1).^( (1:3)' + (1:3) );

disp('Minors:')
disp(Minors)

disp('Cofactors:')
disp(Cofactors)

% Answer should be
% Minors: [18, 3, -13]
%         [7, -11, -1]
%         [8, -23, -22]
% Cofactors: 
%         [18, -3, -13]
%         [-7, -11, 1]
%         [8, 23, -22]

%% 

% Problem 15: Use expansion by cofactors to find the determinant of the
% matrix.
% A = [w x y z; 15 -21 18 30; -10 24 -18 32; -22 40 32 -35]
syms w x y z
A15 = [w x y z;
       15 -21 18 30;
       -10 24 -18 32;
       -22 40 32 -35];

det_A15 = det(A15); % Compute determinant
disp('Determinant of A:')
disp(det_A15)

% Expected output: Determinant of A: 
%       91074*w + 46362*x - 5826*y - 9588*z
