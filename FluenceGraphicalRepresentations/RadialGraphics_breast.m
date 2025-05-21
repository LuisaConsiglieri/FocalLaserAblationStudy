% This script illustrates radial graphical representations on the breast tissue

clear
initial_data
data_work
data_source

% Identifying the breast parameters essential to the computation of the breast fluence rate
% for arbitrary wavelength (ll) and power (pw)
j_tissue = 1;
j_tumor = 1;
j_healthy = 2;

d = 2; % radial profile located at zz(d) = 0
RadialGraphics
