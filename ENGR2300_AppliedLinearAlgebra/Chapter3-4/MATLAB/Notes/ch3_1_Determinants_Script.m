% ENGR2300 ch3_1_Determinants Matlab
% Crystal J. Hollis
% MATLAB Code - Determinant of 2x2 Matrix

A = [3, 5; 
     1, 2];

det_A = det(A);
disp(['Determinant of A: ', num2str(det_A)]);
% Output: Determinant of A: 1

% Explanation
% - `A` defines a 2x2 matrix.
% - `det()` is MATLAB’s built-in function to compute the determinant.
% - `disp()` displays the result, converting the determinant to a string using `num2str()`.

% MATLAB Code - Minors and Cofactors (3x3 Matrix)

% Define the matrix
A = [
    1, 4, 7;
    2, 5, 8;
    3, 6, 9
];

% Compute Minor M11 (delete row 1, col 1)
minor_11 = A;
minor_11(1,:) = []; % Remove 1st row
minor_11(:,1) = []; % Remove 1st column

% Compute the determinant of Minor M11
det_minor_11 = det(minor_11);

% Compute Cofactor C11 (no sign change needed for (1,1))
cofactor_11 = det_minor_11;

% Display Results
disp('Matrix A:');
disp(A);

disp('Minor M11:');
disp(minor_11);

disp(['Determinant of Minor M11: ', num2str(det_minor_11)]);
disp(['Cofactor C11: ', num2str(cofactor_11)]);


% MATLAB Code - Cofactor Expansion (Column 2)

A = [2, -1, 8;
     1,  0, 0;
     3, -5, 0];

det_A = 0; % Initialize determinant

for i = 1:3  % Loop over each row
    minorMatrix = A; 
    minorMatrix(i, :) = []; % Delete row i
    minorMatrix(:, 2) = []; % Delete column 2 (expanding along col 2)
    
    minorDet = det(minorMatrix); % Find minor's determinant
    cofactor = (-1)^(i+2) * minorDet; % Apply cofactor sign rule

    det_A = det_A + A(i,2) * cofactor; % Add cofactor contribution
end

disp(['Determinant using Cofactor Expansion along column 2: ', num2str(det_A)]);
% Final Output: Determinant using Cofactor Expansion along column 2: -40

% MATLAB Code - Determinant of Triangular Matrix

A = [2, -1, 0;
     0, 3, 4;
     0, 0, 5];

% Product of diagonal entries
det_A = prod(diag(A));

disp(['Determinant of triangular matrix: ', num2str(det_A)]);
% Final Output: Determinant of triangular matrix: 30