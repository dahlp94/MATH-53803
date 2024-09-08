function w = euler(f,a,b,alpha,N)
% function w = euler(f,a,b,alpha,N)
% 
% Euler?s method approximates the solution of the initial-value problem.
% 
% On Input: 
% -> f     : the initial-value problem 
% -> a, b  : a and b are real valued end points
% -> alpha : is the initial value
% -> N     : integer representing the number of subintervals
%
% On Output: 
% -> w     : vector approximation w to the function y over [a, b]



h = (b - a) / N;     
t = a;
w = zeros(1,N+1);
w(1) = alpha;

for i = 1:N
    w(i+1) = w(i) + h * feval(f,t,w(i));
    t = a + i * h;
end

return;

end