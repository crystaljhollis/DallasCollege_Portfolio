% Define the encoding matrix A
A = [84, 33; 42, 14];

% Compute the inverse of A
A_inv = inv(A);

% Define the encoded message as a matrix
encoded_message = [
    49, 18; 55, 25; 26, 13; 15, 5;
    90, 35; 60, 23; 37, 15; 60, 20;
    84, 33; 42, 14
];

% Decode the message using matrix multiplication
decoded_message = round(A_inv * encoded_message');

% Transpose to match original pairs
decoded_message = decoded_message';

% Map numbers to letters (A=1, B=2, ..., Z=26, space=0)
alphabet = [' ABCDEFGHIJKLMNOPQRSTUVWXYZ']; % Space is at index 1

% Convert numbers to text
decoded_text = '';
for i = 1:size(decoded_message,1)
    for j = 1:size(decoded_message,2)
        num = decoded_message(i,j);
        if num >= 0 && num <= 26
            decoded_text = [decoded_text, alphabet(num+1)]; % Adjust for indexing
        else
            decoded_text = [decoded_text, '?']; % Unknown characters
        end
    end
end

% Display the decoded message
disp('Decoded Message:');
disp(decoded_text);
