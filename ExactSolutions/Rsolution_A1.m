function output = Rsolution_A1(bt, Rf, rr, index_r)
% This function computes the radial elementary solutions.
% Inputs:
%   bt - Parameter $(\beta_1,\beta_2)$ related to fluence distribution,
%        as defined in Appendices A.2 and B, respectively;
%   Rf       - Maximum value of the radial solution;
%   rr       - Array of r-coordinates;
%   index_r  - Relevant indices in the radial direction, namely the fiber radius $r_\mathrm{f}$ and the inner radius $r_\mathrm{i}$;
%
% Output: R_1 (Appendix A.1) altogether with R_2 (Appendix B).

% ----------------- Input validation -------------------------------
if length(bt) < 2
    error('Invalid input: bt must have at least two elements.');
end

if isempty(rr) || length(index_r) ~= 2
    error('Invalid inputs: rr must be non-empty, and index_r must have two elements.');
end

if index_r(1) < 1 || index_r(1) >= index_r(2) || index_r(2) >= length(rr)
    error('Invalid input: index_r should be 1 <= index_r(1) < index_r(2) < length(rr).');
end
r_f = rr(index_r(1));
r_i = rr(index_r(2));

% Bessel parameters
B1_in = [besselj(0, bt(1)*r_f)  besselj(1, bt(1)*r_f) ; % J0 e J1 para beta1*r_f
         bessely(0, bt(1)*r_f)  bessely(1, bt(1)*r_f) ];
B1_out =[besselj(0, bt(2)*r_i)  besselj(1, bt(2)*r_i) ; % J0 J1 para beta2*r_i
         bessely(0, bt(2)*r_i)  bessely(1, bt(2)*r_i) ];

% Flux at r = r_f: Derivative = 0
W1_in = - (pi/2)*bt(1)*r_f*Rf* B1_in(2, 2);
% Check for Division by Zero, ensure the denominator is non-zero.
eps = 1e-10;
if abs(B1_in(2, 1)) < eps
    error('Division by zero: B1_in(2, 1) is too close to zero.');
end
Y_in = (Rf - W1_in*B1_in(1, 1))/ B1_in(2, 1);

% Continuity at r = r_i
Ri = W1_in*besselj(0, bt(1)*r_i) + Y_in*bessely(0, bt(1)*r_i);
DRi = - bt(1)* (W1_in*besselj(1, bt(1)*r_i) + Y_in*bessely(1, bt(1)*r_i));
% outer Wronskian dependent parameters
W1_out = - (pi/2)*r_i* (DRi*B1_out(2, 1) + bt(2)*Ri*B1_out(2, 2));
% Check for Division by Zero, ensure the denominator is non-zero.
if abs(B1_out(2, 1)) < eps
    error('Division by zero: B1_out(2, 1) is too close to zero.');
end
Y_out = (Ri - W1_out*B1_out(1, 1))/ B1_out(2, 1);

output = zeros(1, length(rr)); % 1x100
for i = 1:length(rr)
  if rr(i) < r_f
    output(i) = Rf;
  elseif rr(i) < r_i
    output(i) = W1_in*besselj(0, bt(1)*rr(i)) + Y_in*bessely(0, bt(1)*rr(i));
  else
    output(i) = W1_out*besselj(0, bt(2)*rr(i)) + Y_out*bessely(0, bt(2)*rr(i));
  end
end

end
