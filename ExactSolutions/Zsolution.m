function phiz = Zsolution(mu_t, eta, zz, ell, index_z)
% This function computes the fluence rate as a function of the longitudinal coordinate \(z\).
% Inputs:
%   mu_t    - Total attenuation coefficient
%   eta     - Parameter related to fluence distribution
%   zz      - Array of z-coordinates
%   ell     - Tumor boundary location
%   index_z - Relevant indices
%
% Output:
%   phiz    - Fluence rate as a function of z

% ----------------- Input validation -------------------------------
if isempty(zz) || length(index_z) ~= 2
    error('Invalid inputs: zz must be non-empty, and index_z must have two elements.');
end

i0 = index_z(1); % Focal point
if i0 < 1 || i0 => length(zz)
    error('Invalid input: index_z(1) should be 1 <= index_z(1) < length(zz).');
end
%------------------------------------------------------

% Preallocate phiz
phiz = zeros(1, length(zz)-i0+1);

if zz(end) <= ell % Only tumor
    for j = i0:length(zz)
        phiz(j-i0+1) = exp(-mu_t * zz(j-i0+1));
    end
else
    L = zz(end);
    iell = index_z(2); % Index defining the range of the tumor
    if iell <= i0 || iell => length(zz)
        error('Invalid input: index_z(2) should be index_z(1) < index_z(2) < length(zz).');
    end
    for j = i0:length(zz)
        if j <= iell % Tumor
            phiz(j-i0+1) = exp(-mu_t * zz(j-i0+1));
        else
            phiz(j-i0+1) = phiz(iell) * sinh(eta * (L - zz(j-i0+1))) / sinh(eta * (L - ell));
        end
    end
end

end
