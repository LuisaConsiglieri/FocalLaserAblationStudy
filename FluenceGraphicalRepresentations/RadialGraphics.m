% This script illustrates radial graphical representations

choice = 1; % blue solid
[ll pw t_p] = data_operating(choice); % wavelength, power and pulse width choice
Fluence_rate
Xtp = exp(zeta_in*t_p);
Rfluence = Fluence_zell(Xtp, rr, phir0, - ss_phir1, z1, phiz1, indices(3:4));
Rbreast1 = plot(rr, Rfluence(:, d), 'b');
hold on

choice = 2; % blue dashed
[ll pw t_p] = data_operating(choice); % wavelength, power and pulse width choice
Fluence_rate
Xtp = exp(zeta_in*t_p);
Rfluence = Fluence_zell(Xtp, rr, phir0, - ss_phir1, z1, phiz1, indices(3:4));
Rbreast2 = plot(rr, Rfluence(:, d), 'b--');
hold on

choice = 3; % red dashed
[ll pw t_p] = data_operating(choice); % wavelength, power and pulse width choice
Fluence_rate
Xtp = exp(zeta_in*t_p);
Rfluence = Fluence_zell(Xtp, rr, phir0, - ss_phir1, z1, phiz1, indices(3:4));
Rbreast3 = plot(rr, Rfluence(:, d), 'r--');
hold off

legStr3 = { '810 nm; 5 W', '980 nm; 5 W', '980 nm; 1.3 W' };
hl = legend([Rbreast1, Rbreast2, Rbreast3], legStr3); % save the legend handle
set( hl, 'fontsize', 12);     % set the font size

xlim([0 rr(end)])
xlabel('r, mm')
ylabel('\phi, W/mm^2')
