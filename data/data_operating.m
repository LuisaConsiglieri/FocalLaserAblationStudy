function [ll, pw, t_pulse] = data_operating(choice)
% return list

l1 = 1;  % regarding to wavelength 810 nm
l2 = 2;  % regarding to wavelength 980 nm
l3 = 3;  % regarding to wavelength 1064 nm
pw1 = 1; % regarding to P_laser 5 W
pw2 = 2; % regarding to P_laser 1.3 W
t_NdYAG = 2e-3; % s = 2 ms
t_diode = 1e-11; % s  1 ps = 1e-12 s between 1 ns = 1e-9 s

switch (choice)
   case 1
     ll = l1; % wavelength choice corresponding to 810 nm
     pw = pw1;
     t_pulse = t_diode;
   case 2
     ll = l2;  % corresponding to wavelength of 980 nm
     pw = pw1;
     t_pulse = t_diode;
   case 3
     ll = l2;
     pw = pw2;
     t_pulse = t_diode;
   otherwise
     ll = l3;  % corresponding to wavelength of 1064 nm
     pw = pw2;
     t_pulse = t_NdYAG;
end

end

