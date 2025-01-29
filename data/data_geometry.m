% This script stores the geometric parameters [mm].

% radial parameters
r_f = 0.3 ;  % radius of optical fiber
r_i = 10 ; % radius of tumor inner = 1 cm
r_fatty = 15 ; % surrounding healthy tissue
r_o = r_i + r_fatty ; % outer radius = 2.5 cm

rr = linspace(0, r_o);
count = 1;
while rr(count) < r_i
    count = count +1;
end

rr(2) = r_f; % matching value

ii = count; % 41 ok
rr(ii) = r_i;

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% longitudinal parameters
L0 = 0 ; % location of the focal point
ell = 2*r_i ; % tumor length
z_fatty = 5 ; % surrounding healthy tissue
L = ell + z_fatty ; % total length = 2.5 cm

zz = linspace(L0, L);
count = 1;
while zz(count) < 0
    count = count +1;
end

i0 = count; % 1
z0 = zz(count); % find(zz==0)
while zz(count) < ell
    count = count + 1;
end

iell = count; % 81
N_out = length(zz(iell:end));  % zz(iell) = 20.152
zz(iell) = ell;

z1 = zz(1 : iell-1);   %   z1(end) = 19.949 ;  length(z1) = 80
z2 = linspace(ell, L, N_out);     % z2(1) = ell;  1x20
