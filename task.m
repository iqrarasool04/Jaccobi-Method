% Hardcoded input matrix A
A = [4 2 3 8; 3 -5 2 -14; -2 3 8 27];

% Ask user for tolerance and max number of iterations
tol = input('Enter the tolerance: ');
max_iter = input('Enter the maximum number of iterations: ');

% Get the size of A
n = size(A, 1);

% Extract the right-hand side of the equation (the constants)
B = A(:, n+1);

% Initialize the solution vectors
X1 = zeros(1, n);
X2 = zeros(1, n);

% Initialize the iteration counter
iter = 0;
% Loop until the maximum number of iterations is reached or the tolerance is met
while iter < max_iter
    % Copy the values of X2 to X1
    X1 = X2;
    
    % Compute the new values of X2 using Jacobis method
    for i = 1:n
        temp_sum = 0;
        for j = 1:n
            if i ~= j
                temp_sum = temp_sum + A(i, j) * X1(j);
            end
        end
        X2(i) = (B(i) - temp_sum) / A(i, i);
    end

    % Compute the norm of the difference between X2 and X1
    norm_val = max(abs(X2 - X1)) / max(abs(X2));
    
    % If the norm is less than the tolerance, exit the loop
    if norm_val < tol
        break;
    end
    
    % Increment the iteration counter
    iter = iter + 1;
end

% Display the solution vector
disp('Solution: ');
disp(X2);
