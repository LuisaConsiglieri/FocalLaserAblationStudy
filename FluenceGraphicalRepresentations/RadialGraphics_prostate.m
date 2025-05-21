% This script illustrates radial graphical representations on the prostate tissue

clear
initial_data
data_work
data_source

% Identifying the prostate parameters essential to the computation of the prostate fluence rate
% for arbitrary wavelength (ll) and power (pw)
j_tissue = 2;
j_tumor = 3;
j_healthy = 4;

d = 2; % radial profile located at zz(d) = 0
RadialGraphics
