% Hey Adam, it's me your friend Zebedee, from school.
% https://www.mathworks.com/help/physmod/sps/powersys/ref/per-unit-and-international-systems-of-units.html

%Inputs
hp = 5;
f = 60;
nV = 208;
Rs = 1;
Ls = 0.003883;
Rr = 1.06;
Lr = 0.009061;
Lm = 0.1485;
Poles = 4;

%base Power, Voltage, Vurrent, Impedance, Resistance, Inductance, Torque
bP = hp * 746/3;
bV = 208/sqrt(3);
bC = bP/bV;
bZ = bV/bC;
bR = bZ;
bI = bZ/(2*pi*f);

pu_Rs = Rs/bR;
pu_Ls = Ls/bI;
pu_Rr = Rr/bR;
pu_Lr = Lr/bI;
pu_Lm = Lm/bI;
