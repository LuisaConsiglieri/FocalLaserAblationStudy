% This script illustrates the graphical representations to the source S(r_f,z)

initial_data
data_source

% for 3x2 in particular: ll = 1,2 (pw=1) and for ll= 2, 3 (pw=2)
source1_breast = zeros(3, 2, length(z1)); % tumor region (z1) z1(end) < z2(1)
source_breast = zeros(3, 2); % at minimum z2(1) discontinuity
source2_breast = zeros(3, 2, length(z2)); % healthy region (z2)
for ll = 1:3
  for pw = 1:2
source1_breast(ll, pw, :) = E(ll,pw,1) *exp( - mu_t(ll,1) *z1);
source_breast(ll, pw) =  E(ll,pw,1) *exp( - mu_t(ll,1) *z2(1));
source2_breast(ll, pw, :) = E(ll,pw,2) *exp( - mu_t(ll,2) *z2);
  end
end 

% Graphical representations to the breast source S
figure
  subplot(1, 2, 1)   % ------------------------- linear -------------------

SourceGraphics_linear(z1, source1_breast, z2, source2_breast)
 
  subplot(1, 2, 2)   % ------------------------- semilogy ------------------
  
SourceGraphics_semilogy(z1, source1_breast, z2, source2_breast)
 