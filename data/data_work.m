% This script stores the working parameters.

% ------------------------Appendix A.1: Particular solution -------------
% Calculate parameters beta, time independent (S1= 0),
% dependent on wavelength  lambda = 810, 980, 1064 nm
%  3*mu_tr(:,j)  = 1/D^{(o)}

% beta < 0
beta = zeros(3,4);
for j = 1:2  % carcinoma breast (inner) + adipose breast (outer)
  beta(:,j) = 3*mu_tr(:,j).*mu_a(:,j) - mu_t(:,1).^2 ;
endfor
for j = 3:4
  beta(:,j) = 3*mu_tr(:,j).*mu_a(:,j) - mu_t(:,3).^2 ;
endfor

% -------------- j_tissue = 1:2 -------------------------------
% for  INNER (tumor) j = 1, 3 % carcinoma breast - prostate tumor
% S1 = zeros(3, 2);
S1(:, 1) = D(:,1).*mu_t(:,1).^2 - mu_a(:,1)  ;
S1(:, 2) = D(:,3).*mu_t(:,3).^2 - mu_a(:,3)  ;

% ------------------- Appendix B -----------------------------
% Calculate parameters eta and beta, outside the tumor
% time dependent, and also dependent on wavelength ll
eta0 = zeros(3, 2);
beta2 = zeros(3, 2);

eta0(:,1) = 3*mu_tr(:,2).*(mu_a(:,2) + S1(:, 1));  % j = 2
beta2(:,1) = eta0(:,1) - mu_t(:,1).^2;   % (beta2_breast > 0)
eta0(:,2) = 3*mu_tr(:,4).*(mu_a(:,4) + S1(:, 2)); % j = 4
beta2(:,2) = eta0(:,2) - mu_t(:,3).^2;

% Computing    D(beta + eta^2) = mu_a +S1
eta0_breast = sqrt(eta0(:,1)); % beta = 0
eta2_breast = sqrt(eta0(:,1) - beta2(:,1)) ; % matriz 3x1

eta0_prostate = sqrt(eta0(:,2)) ; % beta = 0
eta2_prostate = sqrt(eta0(:,2) - beta2(:,2)) ;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% tumor parameters 3x1
zeta_breast = nu(1).*S1(:, 1);
zeta_prostate = nu(3).*S1(:, 2);
% zeta ~ e+11  -- e+13 (>0)

% +++++++++++++++++++++++++++++++++++++++++++++++++++++++

