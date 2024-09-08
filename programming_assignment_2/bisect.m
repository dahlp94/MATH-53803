function [l,r,nf] = bisect(fname,a,b,tol)

%function [l,r,nf] = bisect(fname,a,b,tol)
%
% bisect computes the roots of any continuous functions for which a root
% bracketing interval is given
%
% On Input: 
% -> fname : the name of the m-file which evaluates the function f(x)
% -> a,b   : a and b are real valued end points bracketing the
%            root of the function f(x)
% -> tol   : is an upper bound on length of the final interval [l,r]
%            which also brackets the root of the function f(x)
%
% On Output: 
% -> l,r   : length of the final interval (real valued)
% -> nf    : the total number of function evaluations (of fname) executed



fa = feval(fname, a);   % function evaluation #1
fb = feval(fname, b);   % function evaluation #2
count = 2;              % initial value for function evaluation since we computed fa and fb

if fa * fb > 0          % sign check
    l = NaN;
    r = NaN;
    nf = 2;
    return;
    
elseif fa * fb == 0
    l = a;
    r = b;
    nf = 2;
    return;
    
else
    p = a + (b - a)/2;   % finding the midpoint in the interval [a,b]
    fp = feval(fname, p);
    err = abs(b - a);    % finding the error
    
    count = 3;           % since we are computing fp, the number of function 
                         % evaluation increased by 1
                         
    while err > tol      % checking whether the error is below the tolerance 
        if fa * fp < 0
            b = p;
        else
            a = p;
        end
        
        p = a + (b - a)/2;
        fp = feval(fname, p);
        err = abs(b - a);
        count = count + 1;
        
    end
    
    l = min([a, b]);
    r = max([a, b]);
    nf = count;
    
    return;
    
end
end