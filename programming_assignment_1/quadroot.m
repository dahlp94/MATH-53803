function [x1, x2, err] = quadroot(a,b,c)

%function [x1,x2,err] = quadroot(a,b,c)
%
% quadroot computes the roots of a quadratic polynomial
%
% On Input: the real coefficients a,b,c, for the polynomial a*x^2 + b*x + c
%
% On Output: the roots are given by x1 and x2 and are interpreted through err:
%            err = 0:                  x1 and x2 are the 2 real roots
%            err = 1:                  x1 is the real part and x2 the imaginary part of a complex pair
%            err = 2:                  x1 and x2 are the excatly same real roots
%            err = 3:                  more than 3 coefficients given
%            err = -1:                 less than 3 coefficients given
%            err = -2:                 all coefficients are 0
%            err = -3:                 a and b are 0
%            err = -4:                 a = 0 (x1 is root to b*x + c = 0, x2 = NaN)


if nargin < 3
	x1 = NaN;
	x2 = NaN;
	err = -1;
	return;

elseif nargin > 3
	x1 = NaN;
	x2 = NaN;
	err = 3;
	return;

else
	m = max(abs([a,b,c]));

	if m == 0
		x1 = NaN;
		x2 = NaN;
		err = -2;
		return;
	else
		a = a / m;
		b = b / m;
		c = c / m;

		if abs(a) < eps
			if abs(b) < eps
				if abs(c) < eps
					x1 = NaN;
					x2 = NaN;
					err = -2;
                else
					x1 = NaN;
					x2 = NaN;
					err = -3;
					return;
				end

			else
				x1 = -c / b;
				x2 = NaN;
				err = -4;
				return;
			end

		else
			D = b^2 - 4 * a * c;    % D is the discriminant

			if D < 0
				x1 = -b / (2 * a);
				x2 = sqrt(-D) / (2 * a);
				err = 1;
				return;

			elseif D > 0
				if b < 0
					x1 = (-b + sqrt(D)) / (2 * a);
					x2 = c / (a * x1);
					err = 0;
					return;

				else
					x1 = (-b - sqrt(D)) / (2 * a);
					x2 = c / (a * x1);
					err = 0;
					return;
				end

			else
				x1 = -b / (2 * a);
				x2 = -b / (2 * a);
				err = 2;
				return;

			end
		end

	end
end
end
