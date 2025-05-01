function phiz = Zsolution(mu_t, eta, zz, ell, index_z)
% This function computes the fluence rate as function on the longitudinal coordinate \(z\).

if (zz(end) == ell) % only tumor
  phiz = exp( -mu_t *zz); % 1 x length(zz)
else
  L = zz(end);
  i0 = index_z(1);
  iell = index_z(2);
  for j = i0:length(zz) % from the focal point
    if j <= iell % tumor
      phiz(j-i0+1) = exp( -mu_t *zz(j-i0+1));
    else
      phiz(j-i0+1) = phiz(iell)*sinh(eta*(L-zz(j-i0+1)))/sinh(eta*(L-ell));
    end
  end
end

end
