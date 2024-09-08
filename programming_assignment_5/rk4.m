function w = rk4(f,a,b,alpha,N)

% function w = rk4(f,a,b,alpha,N)
% 
% Order 4 Runge-Kutta method approximates the solution of the initial-value problem.
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
    K_1 = h * feval(f,t,w(i));
    K_2 = h * feval(f,t+h/2,w(i)+K_1/2);
    K_3 = h * feval(f,t+h/2,w(i)+K_2/2);
    K_4 = h * feval(f,t+h,w(i)+K_3);
    
    w(i+1) = w(i) + (K_1 + 2*K_2 + 2*K_3 + K_4) / 6;
    t = a + i * h;
end

return;

end
    