function [L,U] = findLU(A)
% input matrix must be square matrix
% decomposes matrix into LU matrices

% initialize
U = A;

% L is identity matrix to start
L = eye(size(A));
I = eye(size(A));

% operation to obtain L & U matrix
for lv1 = 1:size(A,1)-1     % reference row

    % find index of max value in column
    [~,index] = max(abs(A(lv1:size(A,1),lv1))); % find max 
    index = index + lv1 - 1;    % absolute index
    
    P = eye(size(A)); % permutation matrix
    
    % swap row
    temp_row = P(lv1,:);
    P(lv1,:) = P(index,:);
    P(index,:) = temp_row;
    
    % multiply
    U = P*U;
    
    for lv2 = (lv1+1):size(A,1)     % row to subtract from
        % L matrix is created from the I matrix with conjugate operations
        % of the operations done on the U matrix
        disp(U)
        disp(U(lv2,lv1))
        disp(U(lv1,lv1))
        
        L(lv2,:) = L(lv2,:) + (U(lv2,lv1)./U(lv1,lv1).*I(lv1,:));
        % U matrix created by Gaussian elimination
        U(lv2,:) = U(lv2,:) - (U(lv2,lv1)./U(lv1,lv1).*U(lv1,:));

    end

end

end
