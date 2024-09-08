function p = lagrangeval(x,y,w)
%
% function p = lagrangeval(x,y,w)
%
% A subroutine to evaluate the Lagrange interpolant for a set of knots at
% the set of independent points using Neville's iteration method
%
% Input: 
% -> x   : a vector containing the nodes
% -> y   : the corresponding function values, f(x), for each values of x
% -> w   : a vector containing independent evaluation points
%
% Output: 
% -> p   : a vector containing the values of Lagrange interpolant
%          evaluated at each values of w
% 



size_x = size(x,2);         % finding the size of the vector x
size_w = size(w,2);         % finding the size of the vector w


Q = zeros(size_x,size_x);   % creating a square matrix based on size of 
                            % the vector x with zeros as entries

for k = 1: size_x           % replacing the first column of the matrix Q 
    Q(k,1) = y(k);          % with the function value for each point in x
end

some_array = [];            % creating an empty array
count = 1;                  % creating an integer variable for storing values
                            % when count is the required position
row_a = 0;                  % a running value to find row position of Q
column_b = 0;               % a running value to find column position of Q
break_flag = 0;             % a necessary value to exit the nested loop conditions


% the main loop incorporating Neville's Iterated Interpolation Method
% the loop runs for each values of vector w
for m = 1:size_w                % loop #1          
    for i = 2:size_x            % loop #2
        for j = 2:i             % loop #3
            row_a = i;
            column_b = j;
            zero_check = ( x(i) - x(i-j+1) ) / x(i-j+1);  % calculating the relative 
                                                          % error for the denominator
            
            if abs(zero_check) >= eps       % careful about division by zero   
                Q(i,j) = ( (w(m) - x(i-j+1)) * Q(i,j-1) - (w(m) - x(i)) * Q(i-1, j-1) ) / (x(i) - x(i-j+1));
            
            else
                break_flag = 1;          % break_flag value changed to 1
                break                    % exit out of loop #3
            end
            
        end
        
        
        if break_flag == 1        % execute this statement if the condition is TRUE
            break                 % exit out of loop #2
        end
    end
 
   some_array(count) =  Q(row_a,column_b);  % finding the corresponsing values in 
                                            % the matrix Q and adding them to some_array
                                            % 
   count = count + 1;                       % incrementing the count to get the next 
                                            % position in some_array
end

p = some_array;                             % assigning some_array to p; p is a vector

return;                                     % returning p as required

end

