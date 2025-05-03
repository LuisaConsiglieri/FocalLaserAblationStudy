function phiz = Zsolution(mu_t, eta, zz, ell, index_z)
% This function computes the fluence rate as a function of the longitudinal coordinate \(z\).
% Inputs:
%   mu_t    - Total attenuation coefficient
%   eta     - Parameter related to fluence distribution
%   zz      - Array of z-coordinates
%   ell     - Tumor boundary location
%   index_z - Indices defining the range of the tumor
%
% Output:
%   phiz    - Fluence rate as a function of z

% Input validation
if isempty(zz) || length(index_z) ~= 2
    error('Invalid inputs: zz must be non-empty, and index_z must have two elements.');
end

% Preallocate phiz
phiz = zeros(1, length(zz)); % Preallocate for efficiency

% Check if zz(end) is approximately equal to ell
if abs(zz(end) - ell) < 1e-6 % Only tumor
    phiz = exp(-mu_t * zz); % 1 x length(zz)
else
    L = zz(end);
    i0 = index_z(1);
    iell = index_z(2);
    for j = i0:length(zz) % From the focal point
        if j <= iell % Tumor
            phiz(j-i0+1) = exp(-mu_t * zz(j-i0+1));
        else
            % Ensure denominator is non-zero
            denom = sinh(eta * (L - ell));
            if abs(denom) < 1e-6
                error('Division by zero: sinh(eta * (L - ell)) is zero.');
            end
            phiz(j-i0+1) = phiz(iell) * sinh(eta * (L - zz(j-i0+1))) / denom;
        end
    end
end

end
