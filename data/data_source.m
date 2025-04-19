% This script stores parameters for S(r_f,z), LOCAL, discontinuous at z = ell

%  3x4 breast tumor + healthy - prostate tumor + healthy
SS = zeros(3,4);
for l = 1:3
  for j = 1:4
    SS(l,j) = mu_s(l,j)* (mu_t(l,j) + g(l,j)*mu_a(l,j)) / mu_tr(l,j);
  end
end

% Maximum source values (r < r_f)
E = zeros(3,2,4);  % source of scattered photons S [W/m3]
for ll = 1:3
  if (ll == 1)
    for j = 1:4
      E(ll, 1, j) = SS(ll,j)*P_laser(1) /( pi* r_f^2 );
    end
  elseif (ll == 2)
    for pw = 1:2
      for j = 1:4
        E(ll, pw, j) = SS(ll,j)*P_laser(pw) /( pi* r_f^2 );
      end
    end
  elseif (ll == 3)
    for j = 1:4
      E(ll, 2, j) = SS(ll,j)*P_laser(2) /( pi* r_f^2 );
    end
  end
end


