% This script stores the working parameters.

% ------------------------Appendix A.1: Particular solution -------------
% Calculate parameters beta, time independent (S1 = 0), dependent on wavelength  lambda = 810, 980, 1064 nm

beta = zeros(3, 4);
for j = 1:2 % breast carcinoma (inner) + adipose (outer)
  beta(:, j) = 3*mu_tr(:,j).*mu_a(:,j) - mu_t(:,1).^2;
end
for j = 3:4 % prostate tumor (inner) + healthy (outer)
  beta(:, j) = 3*mu_tr(:,j).*mu_a(:,j) - mu_t(:,3).^2;
end

% -------------- j_tissue = 1:2 -------------------------------
% for  INNER (tumor) j = 1, 3 % breast carcinoma - prostate tumor
S1 = zeros(3, 2);
S1(:, 1) = D(:,1).*mu_t(:,1).^2 - mu_a(:,1);
S1(:, 2) = D(:,3).*mu_t(:,3).^2 - mu_a(:,3);

% ------------------- Appendix B -----------------------------
% Calculate parameters eta and beta, outside the tumor
% time dependent, and also dependent on wavelength ll
eta0 = zeros(3, 2);
beta2 = zeros(3, 2);

eta0(:, 1) = 3*mu_tr(:,2).*(mu_a(:,2) + S1(:, 1));  % j = 2
beta2(:, 1) = eta0(:, 1) - mu_t(:,1).^2;
eta0(:, 2) = 3*mu_tr(:,4).*(mu_a(:,4) + S1(:, 2)); % j = 4
beta2(:, 2) = eta0(:, 2) - mu_t(:,3).^2;

% Computing    D(beta + eta^2) = mu_a +S1
eta = sqrt(eta0); % beta = 0

eta2_breast = sqrt(eta0(:, 1) - beta2(:, 1)); % matriz 3x1
eta2_prostate = sqrt(eta0(:, 2) - beta2(:, 2));

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% tumor parameters 3x2
zeta = zeros(3, 2);
zeta(:, 1) = nu(1).*S1(:, 1);
zeta(:, 2) = nu(3).*S1(:, 2);
