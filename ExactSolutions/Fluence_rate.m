% This script computes the fluence rate
% for arbitrary wavelength (ll), power (pw), and
% tissue (j_tissue), tumor (j_tumor), healthy (j_healthy) indices.

% elementary functions R(r)  (0 --> r_f --> r_i --> FIND r_o)
S_in = E(ll, pw, j_tumor)/S1(ll,j_tissue); 

% Appendix A.2: General solution
a = r_i;
b0 = gamma_r(j_tumor)*S_in/(gamma_r(j_tumor)*log(a/r_f) + D(ll, j_tumor)/a);

% Appendices A.2 (zeta = zeta_in, beta1 = 0) + B
beta_out = beta2(ll, j_tissue); 
phir0 = Rsolution_A2(beta_out, S_in, rr, indices(1:2), b0); % 1x100

% Appendices A.1 (zeta = 0) + B
% 1x2 tumor (INNER) and healthy (OUTER)
beta1 = sqrt(- [ beta(ll, j_tumor) beta(ll, j_healthy) ]) ; % 1x2 in and out
Rbc = D(ll, j_tumor)/ D(ll, j_healthy);
ss_phir1 = Rsolution_A1(beta1, S_in, rr, indices(1:2), Rbc);


% elementary functions Z(z)
% Parameter of the elementary function Z(z)
eta1 = eta(ll, j_tissue);

% --------------------- At z < L ----------------------------
phiz0 = Zsolution(mu_t(ll, j_tumor), eta1, zz, ell, indices(3:4)); 

% --------------------- At z < ell ----------------------------
phiz1 = Zsolution(mu_t(ll, j_tumor), eta1, z1, ell, indices(3:4)); % 1x100  tumor


% Parameter of the elementary function X(t)
zeta_in = zeta(ll, j_tissue); % Breast tumor parameter
