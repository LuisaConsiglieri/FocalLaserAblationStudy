function ssphir0 = Rsolution_A2(beta_out, Rf, rr, index_r, b0)
% This function computes the radial elementary solutions.
% Inputs:
%   beta_out - Parameter $\beta_2$ related to fluence distribution, as defined in Appendix B;
%   Rf       - Maximum value of the radial solution;
%   rr       - Array of r-coordinates;
%   index_r  - Relevant indices in the radial direction, namely the fiber radius $r_\mathrm{f}$ and the inner radius $r_\mathrm{i}$;
%   b0       - positive constant determined with the Robin boundary condition (6), which is given at Appendix A2.
%
% Output:
%   ssphir0  - R_3 (Appendix A.2) altogether with R_4 (Appendix B).

% ----------------- Input validation -------------------------------
if isempty(rr) || length(index_r) ~= 2
    error('Invalid inputs: rr must be non-empty, and index_r must have two elements.');
end

if index_r(1) < 1 || index_r(1) >= index_r(2) || index_r(2) >= length(rr)
    error('Invalid input: index_r should be 1 <= index_r(1) < index_r(2) < length(rr).');
end

r_f = rr(index_r(1));
r_i = rr(index_r(2));

% Continuity at r = r_i
Ri = Rf - b0*log(r_i/r_f); 
DRi = - b0/r_i; 

if beta_out < 0
  b_o = sqrt(-beta_out);
  % Bessel parameters
  Bi =[besselj(0, b_o*r_i)  besselj(1, b_o*r_i) ; % J0 J1 para beta_out at r_i
       bessely(0, b_o*r_i)  bessely(1, b_o*r_i) ];
  %% J_0' = - b_o J_1  , Y_0' = - b_o Y_1
  % Wronskian dependent constants
  Jo = - (pi/2)*r_i*( DRi*Bi(2, 1) + b_o*Ri*Bi(2, 2));
  % Check for Division by Zero, ensure the denominator is non-zero.
  eps = 1e-6;
  if abs(Bi(2, 1)) < eps
    error('Division by zero: Bi(2, 1) is too close to zero.');
  end
  Yo = (Ri - Jo*Bi(1, 1))/Bi(2, 1);
  
elseif  beta_out > 0
  b_o = sqrt(beta_out);
  % Bessel parameters
  Bi =[besseli(0, b_o*r_i)  besseli(1, b_o*r_i) ; % I0 I1 para beta_out at r_i
       besselk(0, b_o*r_i)  besselk(1, b_o*r_i) ];
  %%  I_0' = + b_o I_1 , K_0' = - b_o K_1
  Io = r_i*(DRi* Bi(2, 1) + b_o*Ri*Bi(2, 2));
  % Check for Division by Zero, ensure the denominator is non-zero.
  eps = 1e-6;
  if abs(Bi(2, 1)) < eps
    error('Division by zero: Bi(2, 1) is too close to zero.');
  end  
  Ko = (Ri - Io*Bi(1, 1))/Bi(2, 1); 
end

ssphir0 = zeros(1,length(rr)); % 1x100
% Calculations of the fluence rate as function of the radius
for i = 1:length(rr)
  if rr(i) < r_f
    ssphir0(i) = Rf;
  elseif rr(i) < r_i
    ssphir0(i) =  Rf - b0*log(rr(i)/r_f);
  else
      if beta_out < 0
        Dphir0 = - b_o*(Jo*besselj(1, b_o*rr(i)) + Yo*bessely(1, b_o*rr(i)));
        if Dphir0 > 0
          break;
        else
          ssphir0(i) = Jo*besselj(0, b_o*rr(i)) + Yo*bessely(0, b_o*rr(i));
        end
      elseif beta_out > 0
        Dphir0 = b_o*(Io*besseli(1, b_o*rr(i)) - Ko*besselk(1, b_o*rr(i)));
        if Dphir0 > 0
          break;
        else
          ssphir0(i) = Io*besseli(0, b_o*rr(i)) + Ko*besselk(0, b_o*rr(i));
        end
      else
        % Handle beta_out == 0 
      end
  end
end

end

