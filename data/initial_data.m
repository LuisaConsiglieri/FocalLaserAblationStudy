% This script stores the initial data [mm].

% -------------------- geometric parameters --------------------

% -------------------- radial parameters --------------------
r_f = 0.3 ; % radius of optical fiber
r_i = 10.0 ; % radius of tumor inner

il = 3; % index of laser fiber radius
rr = 0:r_f/(il-1):99*r_f/2;
count = 1;
while rr(count) < r_i
  count++;
end

ii = count; % index of the inner radius
rr(ii) = r_i; % matching value
interface = [ ii-1 ii ii+1];  % rr(interface)

% -------------------- longitudinal parameters --------------------
L0 = 0 ; % location of the focal point
ell = 2*r_i ; % tumor length
z_fatty = 5.0 ; % surrounding healthy tissue
L = ell + z_fatty ; % total length = 2.5 cm

zz = linspace(L0, L);
if L0 == 0
  i0 = 1;
else
  count = 1;
  while zz(count) < 0
    count++;
  end
  i0 = count; % index of z = 0
endif

z0 = zz(i0); % find(zz==0)
count = i0;
while zz(count) < ell
  count++;
end

iell = count; % index of z = ell
N_out = length(zz(iell:end));
zz(iell) = ell; % matching value

z1 = zz(1:iell-1);   %   z1(end) = 19.949 ;  length(z1) = 80
z2 = linspace(ell, L, N_out);     % z2(1) = ell;  1x20

indices = [il ii i0 iell];

% -------------------- optical parameters --------------------

% wavelength [nm]
lambda = [810  980  1064];

% absorption coefficient [cm^(-1)= 0.1 mm^(-1)] breast tumor + fatty - prostate tumor + healthy
mu_a = [0.1   0.08   0.15 0.06 ;  % lambda = 810 nm
        0.2   0.07   0.16 0.05 ;  % lambda = 980 nm
        0.25  0.06   0.17 0.04 ] * 0.1; % lambda = 1,064 nm
% 4.0e-3 < mu_a < 5.0e-2 , 0.1 < mu_sr < 2.0.

% reduced scattering coefficient [mm^(-1)]
% scale parameter [mm^(-1)] carcinoma breast + adipose breast - prostate + healthy
a = [2.1 2.0  3.4 3.0];
% scattering power
b = [1.487 1.054  1.712 1.549];

for l =1:3
  for j =1:4
    mu_sr(l,j) = a(j)* (lambda(l) /500)^(-b(j));
  end
end

% breast tumor + fatty tissue - prostate tumor + healthy tissue
g = [  0.7   0.8     0.8  0.86;  % lambda = 810 nm
       0.75  0.85    0.85 0.91;  % lambda = 980 nm
       0.8   0.9     0.9  0.96]; % lambda = 1,064 nm

mu_s = mu_sr ./ (1-g) ; % 3x4 scattering coefficient [mm^(-1)]
mu_t = mu_a + mu_s;   % total attenuation coefficient [mm^(-1)]
mu_tr = mu_a + mu_sr; % 3x4 transport attenuation coefficient [mm^(-1)]
D = (3*mu_tr).^(-1);  % 3x4 diffusion coefficient [mm]

mu_eff2 =  3*mu_tr.*mu_a ; % = mu_a/D
mu_eff = sqrt(mu_eff2);
 PenetrationDepth = 1./mu_a; % [mm]
 EffeciveOpticalPenetration = 1./mu_eff; % [mm]

% maximum optical power output by the laser
P_laser = [5 1.3] ; % watt
% relative refractive index
n = [ 1.4 1.4 1.35 1.35]; %  breast + prostate
nu = 3*10^(8+3) ./n; % 1x4 light velocity [mm/s]

