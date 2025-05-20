function fluence = Fluence_zell(Xtp, rr, phir0, ssphir, z1, phiz1, i0)
% This function computes the fluence phi(r,z), z < ell

Rfluence = zeros(1, length(rr));
for i = 1:length(rr)
  Rfluence(i) = phir0(i) * Xtp + ssphir(i);
  if Rfluence(i) <= 0
    break;
  end
end

fluence = zeros(length(rr), length(z1)-i0+1);
for j = i0:length(z1) % tumor
  fluence(:,j) = phiz1(j-i0+1) *Rfluence;
end

end

