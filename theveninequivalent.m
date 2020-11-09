
clear 
clc 

% Thevenin equivalent equation 

% 1iust for test purposes : 
r1 = 0.641 ; % Stator resistance 
x1 = 1.102 ; % Stator Reactance 
r2 = 0.332 ; % Rotor resistance 
x2 = 0.464 ; % rotor reactance 
xm = 26.3 ;  % magnetizing branch reactance
v_phase = 460/sqrt(3) ;  % note that v_phase is 3vtriphase 
n_sync = 1800 ; % synchronous speed rpm 
w_sync = n_sync * 2*pi/60 ; % Conversion from rpm en rad/s 
s = 1 ; % slip 

% Calculate Thevenin voltage and impedance 
v_th = v_phase * (xm / sqrt(r1^2 + (x1 + x2)^2)) ; 
z_th = ((1i*xm)*(r1+1i*x1))/(r1 + 1i*(x1+xm)) ; 
r_th = real(z_th) ; 
x_th = imag(z_th) ; 



t_ind = (3*(v_th^2)*r2/s / ( w_sync * ((r_th + (r2/s))^2 + (x_th + x2)^2))) ; 
