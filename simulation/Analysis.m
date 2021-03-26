
clear 
clc 
% This Code is only for analyzing the motor that we have and outputting the
% torque speed characteristic


% : 
p = 4 ; % poles 
B = 0.00281 ; 
J = 0.0155 ; 
r1 =   1 ; % Stator resistance 
x1 = 1.4633 ; % Stator Reactance 
r2 = 1.06 ; % Rotor resistance 
x2 = 3.41437 ; % rotor reactance 
xm = 55.95636 ;  % magnetizing branch reactance
v_phase = 220 ;  % note that v_phase is 3vtriphase 
n_sync = 120*60/p ; % synchronous speed rpm 
w_sync = n_sync * 2*pi/60 ; % Conversion from rpm en rad/s  


% Calculate Thevenin voltage and impedance 
v_th = v_phase * (xm / sqrt(r1^2 + (x1 + xm)^2)) ; 
z_th = ((1i*xm)*(r1+1i*x1))/(r1 + 1i*(x1+xm)) ; 
r_th = real(z_th) ; 
x_th = imag(z_th) ; 

% Define Slip 
s = (0:1:50)/50 ; % slip
s(1) = 0.001 ; 
nm = (1-s) * n_sync ; 

for ii = 1:51 
    t_ind(ii) = (3*(v_th^2)*r2/s(ii) / ( w_sync * ((r_th + (r2/s(ii)))^2 + (x_th + x2)^2))) ; 
end

plot(nm,t_ind,'Color','k','Linewidth',1.2) ; 
xlabel( ' \itn_{m}' , 'Fontweight' , 'Bold' ) ;
ylabel( ' \tau_{ind} ' , 'Fontweight' , 'Bold' ) ;
grid on ;  

