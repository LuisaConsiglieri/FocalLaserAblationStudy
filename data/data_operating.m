function [ll, pw, t_pulse] = data_operating(choice)
% return list

l1 = 1;  % regarding to wavelength 810nm
l2 = 2;  % regarding to wavelength 980nm
l3 = 3;  % regarding to wavelength 1064nm
pw1 = 1; % regarding to P_laser 5W
pw2 = 2; % regarding to P_laser 1.3W
t_NdYAG = 2e-3; % s = 2ms
t_diode = 1e-11; % s  1ps = 1e-12 s between 1ns = 1e-9 s

switch (choice)
   case 1
     ll = l1; % wavelength choice corresponding to 810nm
     pw = pw1;
     t_pulse = t_diode;
   case 2
     ll = l2;  % corresponding to wavelength of 980nm
     pw = pw1;
     t_pulse = t_diode;
   case 3
     ll = l2;
     pw = pw2;
     t_pulse = t_diode;
   otherwise
     ll = l3;  % corresponding to wavelength of 1064nm
     pw = pw2;
     t_pulse = t_NdYAG;
end

end

