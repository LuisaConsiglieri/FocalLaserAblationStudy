function phiz = Zsolution(mu_t, eta, zz, ell, index_z)

if (zz(end) == ell) % only tumor
  phiz = exp( -mu_t *zz); % 1x100
else
  L = zz(end);
  i0 = index_z(1);
  iell = index_z(2);
  for j = i0:length(zz) % from the focal point
    if j <= iell % = 81 (tumor)
      phiz(j-i0+1) = exp( -mu_t *zz(j-i0+1));
    else
      phiz(j-i0+1) = phiz(iell)*sinh(eta*(L-zz(j-i0+1)))/sinh(eta*(L-ell));
    endif
  endfor
endif

endfunction

% zz_end = zz(end);
%  if zz_end == L


  z1 = zz(1 : iell-1);
  phiz_in = exp( -mu_t *z1); % z < ell

  zz_out = L - zz(iell,end); %1x20 outer region
  phiz_out = phiz_in(end)*sinh(eta*zz_out)/sinh(eta*(L- ell)); % 1x20

  output = [phiz_in phiz_out];

