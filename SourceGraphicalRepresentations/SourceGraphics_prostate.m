% This script illustrates the graphical representations to the source S(r_f,z)

initial_data
data_source
  
source1_prostate = zeros(3, 2, length(z1)); % tumor region (z1) z1(end) < z2(1)
source_prostate = zeros(3, 2); % at minimum z2(1) discontinuity
source2_prostate = zeros(3, 2, length(z2)); % healthy region (z2)
for ll = 1:3
  for pw = 1:2
source1_prostate(ll, pw, :) = E(ll,pw,3) *exp( - mu_t(ll,3) *z1);
source_prostate(ll, pw) = E(ll,pw,3) *exp( - mu_t(ll,3) *z2(1));
source2_prostate(ll, pw, :) = E(ll,pw,4) *exp( - mu_t(ll,4) *z2);
  end
end

% Graphical representations to the prostate source S
figure
  subplot(1, 2, 1)  % ------------------------- linear ---------------------
SourceGraphics_linear(z1, source1_prostate, z2, source2_prostate)


  subplot(1, 2, 2)  % ------------------------- semilogy ------------------
  
SourceGraphics_semilogy(z1, source1_prostate, z2, source2_prostate)
