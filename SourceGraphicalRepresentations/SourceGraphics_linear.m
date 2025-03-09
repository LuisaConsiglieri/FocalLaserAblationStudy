function SourceGraphics_linear(z1, source1, z2, source2)
% This function illustrates the graphical representations to the source S(r_f,z)
 
% --------------------------Linear ------------------------
ll = 1;  % 810nm and pw = 1
plot(z1, source1(ll, 1, :), 'b', z2, source2(ll, 1, :), 'b')
hold on
 
ll = 2;  % 980nm 
pw = 1;
plot(z1, source1(ll, pw, :), 'b--', z2, source2(ll, pw, :), 'b--')
hold on
pw = 2;
plot(z1, source1(ll, pw, :), 'r--', z2, source2(ll, pw, :), 'r--')
hold on

ll = 3; % 1064nm, pw = 2
plot(z1, source1(ll, 2, :), 'r', z2, source2(ll, 2, :), 'r')

xlabel('z, mm')
ylabel('S, W/mm^3')

endfunction
