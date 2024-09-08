function [x,nf] = secant(fname,x0,x1,tol)

% function [x,nf] = secant(fname,x0,x1,tol)
%
% secant computes the roots of any continuous function using two initial
% values which should be ideally close to the root of the function.
%
% On Input: 
% -> fname : the name of the m-file which evaluates the function f(x)
% -> x0,x1 : real valued initial approximations of the root
% -> tol   : is a stopping tolerance
%
% On Output: 
% -> x     : real valued approximation that is within the tolerance
% -> nf    : the total number of function evaluations (of fname) executed



f0 = feval(fname, x0);   % function evaluation #1
f1 = feval(fname, x1);   % function evaluation #2
count = 2;

x_new = x1 - f1 * (x1 - x0) / (f1 - f0);

err = abs(x_new - x1);

while err > tol
    x0 = x1;
    x1 = x_new;
    f0 = f1;
    f1 = feval(fname, x1);
    count = count + 1;

    if abs(f0 - f1) ~= 0
        x_new = x1 - f1 * (x1 - x0) / (f1 - f0);
        err = abs(x_new - x1);
        
    else
        break
    
    end
    
end

x = x1;
nf = count;

return;
end
