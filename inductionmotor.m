function varargout = inductionmotor(varargin)
warning('off','MATLAB:dispatcher:InexactCaseMatch')
% INDUCTIONMOTOR Application M-file for TransformerTests.fig
%    FIG = INDUCTIONMOTOR launch TransformerTests GUI.
%    INDUCTIONMOTOR('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 21-Feb-2010 10:24:16
% warning('off','MATLAB:dispatcher:InexactMatch')
 
if nargin == 0  % LAUNCH GUI
fig = openfig(mfilename,'reuse');% Generate a structure of handles to pass to callbacks, and store it. 
handles = guihandles(fig);
guidata(fig, handles);


%  picture
ax4=axes('Position',[0.7  .72  .2  .2]);
[x,map] = imread('IMPic1','jpg');
image(x)
set(gca,'visible','off')
      
ax1=axes('Position',[0  .48  .9  .23]);
% This program draws the induction motor equivalent circuit
ths = 0:.0025:pi;
xs1 =1.45+0.075*cos(ths);
ys1 = 1.2 +0.075*sin(ths);
xs2 =1.6+0.075*cos(ths);
xs3 =1.75+0.075*cos(ths);
xs4 =1.9+0.075*cos(ths);
x5 = [0.75 0.75 .8];
y5 =[1.2 1.0 1.0];
x6 = [1.1 1.3 1.3];
y6 = [1.0 1.0  0];
xw = [0.65  0.65  1.4  1.4  0.65];
yw = [0.95  1.35  1.35  0.95  0.95];
% R_c
xr=[.5   .5   .3   .3   .35  .25   .35   .25   .35   .25   .35   .25   .3  .3  .5  .5];
yr=[1.2   1     1  .775 .75  .7    .65   .60   .55   .50   .45   .40   .375 .2 .2  0];
% X_m
thm=-pi/2:.0025:pi/2;
xm=0.7+0.05*cos(thm);
ym=.05*sin(thm);
xxm=[xm     xm      xm  xm] ;

yxm=[.4+ym 0.5+ym 0.6+ym 0.7+ym];

x1=[0.4  .65 .7     .80  0.9   1.0   1.1   1.2   1.25  1.575  ];
y1=[1.2   1.2  1.3    1.1  1.3   1.1   1.3    1.1   1.2  1.2];

plot(x1-1.2, y1,'b', 'erasemode','none')
hold on
axis('equal')
axis off
plot(xs1-1,ys1,'b', xs2-1,ys1, 'b', xs3-1,ys1,'b', xs4-1, ys1,'b') 
xv1=[.3  .7  .7];
yv1=[1   1   .75];
xv2=[.5  .5  .7 .7 ];
yv2=[0  .2   .2  .35];
plot(xr+.8, yr, 'b')
plot(xxm+.8, yxm, 'b')
plot(xv1+.8, yv1,'b', xv2+.8, yv2, 'b')
x21=[3.2-.025  3.6  3.6];
y21=[1.2 1.2  .9];
x22=[-.8  3.6  3.6];
y22=[0  0   .3];
xL2=[3.55  3.55  3.65  3.65  3.55];
yL2=[.3  .9  .9  .3  .3];
plot(x21, y21, 'b',x22, y22,'b')
plot(xL2, yL2,'b')
x2=1.0+[0.6  .65 .7     .80  0.9   1.0   1.1   1.2   1.25  1.575  ];
y2=[1.2   1.2  1.3    1.1  1.3   1.1   1.3    1.1   1.2  1.2];
plot(x2, y2,'b')
plot(1.2+xs1,ys1,'b', 1.2+xs2,ys1, 'b', 1.2+xs3,ys1,'b', 1.2+xs4, ys1,'b') 
xd1=[.9750   1.6];
yd1=[1.2  1.2];
plot(xd1, yd1, 'b') 
text(-.835,1.1625, '\circ', 'color', [0 0 1])
text(-.835,-.0375, '\circ', 'color', [0 0 1])
text(-.8, .6, 'V_{1\phi}', 'Fontsize', 8, 'color', [0 0 .675])
text(1.6, .35, 'X_{m}', 'Fontsize', 8, 'color', [0 0 .675])
text(.9, .35, 'R_{c}', 'Fontsize', 8, 'color', [0 0 .675])
text(-.34, .975, 'R_1', 'Fontsize', 8, 'color', [0 0 .675])
text(.6, 1.05, 'X_1', 'Fontsize', 8, 'color', [0 0 .675])
text(1.85, 1, 'R_2^\prime', 'Fontsize', 8, 'color', [0 0 .675])
text(2.9, 1.05, 'X_2\prime', 'Fontsize', 8, 'color', [0 0 .675])
text(3.7, .6, 'R_L^\prime= {R_2}^\prime(1-s)/s', 'Fontsize', 8, 'color', [0 0 .675])
%text(5.5, .6, 'V_2', 'Fontsize', 8, 'color', [0 0 .675])
%text(8.75, .6, 'S_{Load}', 'Fontsize', 8, 'color', [0 0 .675])
text(-.2, -.1, 'Equivalent Circuit per phase referred to the Stator', 'color',[0 0 .675])
%%%%%%%%
hold off

%%%%%%%%%%%%
%Squirrel cage
ax2=axes('Position',[0.3  .2  .25  .25]);
R=.5; N=60;
[x,y,z]= cylinder(R,N);
Rotor=mesh(x,y,z); axis off, axis('square')

set(Rotor, 'erasemode', 'background');
rotation_increment=.2; % degree
rotation_axis=[0 0 1];

rotation_origin=[0  0  0];

incr=30/rotation_increment;
for loop =.1:incr
   rotate(Rotor, rotation_axis, incr, rotation_origin);
   drawnow 
end
 %hold off  
 %%%%%%%%%%%% 
 
 
	if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		if (nargout)
			[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
		else
			feval(varargin{:}); % FEVAL switchyard
		end
	catch
		disp(lasterr);
	end

end


%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and 
%| sets objects' callback properties to call them through the FEVAL 
%| switchyard above. This comment describes that mechanism.
%|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN)
%|
%| The subfunction name is composed using the object's Tag and the 
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'.
%|
%| H is the callback object's handle (obtained using GCBO).
%|
%| EVENTDATA is empty, but reserved for future use.
%|
%| HANDLES is a structure containing handles of components in GUI using
%| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in
%| the figure's application data using GUIDATA. A copy of the structure
%| is passed to each callback.  You can store additional information in
%| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see
%| the updates. Type "help guihandles" and "help guidata" for more
%| information.
%|
%| VARARGIN contains any extra arguments you have passed to the
%| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo))
%| Add any extra arguments after the last argument, before the final
%| closing parenthesis.






% --------------------------------------------------------------------
function varargout = V_LText_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = f_sText_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = P_nText_Callback(h, eventdata, handles, varargin)
%--------------------------------------------------------------------
function varargout = R_1Text_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = X_1Text_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = R_2Text_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = X_2Text_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = R_cText_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = X_mText_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = SlipText_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = ProtText_Callback(h, eventdata, handles, varargin)
% --------------------------------------------------------------------
function varargout = pushbuttonSolve_Callback(h, eventdata, handles, varargin)

%              ANALYSIS OF THE EQUIVALENT CIRCUIT
%               OF A THREE-PHASE INDUCTION MOTOR
%
%    The equivalent circuit can be used to determine the operating
%    characteristics an induction motor. Among the important aspects
%    in the steady-state are the variation of current, power, losses
%    and torque associated with various operating conditions.  Upon
%    entering the parameters of the equivalent circuit, performance
%    characteristics are obtained for the specified slip and the torque
%    slip curve is plotted on the screen.
%
% Copyright (C) 1999 by H. Saadat, Revised Summer 2002


%function [Rclv, Xmlv, Rchv, Xmhv, Zelv, Zehv, Ic, Io, Re, Zemag, Error] = OcScTest;
Error = 0;
V_LHandle=findobj(gcbf, 'Tag','V_LText');
Vm=eval(get(V_LHandle,'String'));
f_sHandle=findobj(gcbf, 'Tag','f_sText');
f=eval(get(f_sHandle,'String'));
P_nHandle=findobj(gcbf, 'Tag','P_nText');
P=eval(get(P_nHandle,'String'));
R_1Handle=findobj(gcbf, 'Tag','R_1Text');
R1=eval(get(R_1Handle,'String'));
X_1Handle=findobj(gcbf, 'Tag','X_1Text');
X1=eval(get(X_1Handle,'String'));
R_2Handle=findobj(gcbf, 'Tag','R_2Text');
R2=eval(get(R_2Handle,'String'));
X_2Handle=findobj(gcbf, 'Tag','X_2Text');
X2=eval(get(X_2Handle,'String'));
R_cHandle=findobj(gcbf, 'Tag','R_cText');
Rc=eval(get(R_cHandle,'String'));
X_mHandle=findobj(gcbf, 'Tag','X_mText');
Xm=eval(get(X_mHandle,'String'));
SlipHandle=findobj(gcbf, 'Tag','SlipText');
S=eval(get(SlipHandle,'String'));
ProtHandle=findobj(gcbf, 'Tag', 'ProtText');
Prot=eval(get(ProtHandle,'String'));

j = sqrt(-1);
Z1 = R1 + j*abs(X1);
Z2s= R2 +j*abs(X2);
if Rc ==0 || Xm==0
   Error = 1;
   plot(0, 0), axis off
   text(-1, .6,'Data error:  R_c an R_m cannot be zero, 0 < R_c \leq inf & 0 < X_m \leq inf', 'color', [1 0 0], 'erasemode','xor')
   text(-1, .25, 'Enter the correct value for R_c or X_m and try again. If neglected enter inf','color',[1 0 0], 'erasemode','xor');
   return, end
   if S > 1 || S <= 0
     Error=2;
     plot(0, 0), axis off
     text(-1, .5,'Data error:   s must be in per unit in the following range', 'color', [1 0 0], 'erasemode','xor')
   text(-1,  .25, '0 < s \leq 1. Enter the correct value for s and try again.','color',[1 0 0], 'erasemode','xor');
   return, end
if R2 ==0 
   Error = 3;
   plot(0, 0), axis off
  text(-.6, .4,'Data error:  R_2 cannot be zeo, enter the correct value and try again', 'color', [1 0 0], 'erasemode','xor')
  return, end

%%%%%%%
Vmp=Vm/sqrt(3);
V= Vmp+j*0;
Ns=120.*f/P;
Nr=(1.-S)*Ns;
Ws=2.*pi*Ns/60;
Wr=(1.-S)*Ws;
Zrd=R2+j*abs(X2);
if S~= 0
RLd= R2*(1-S)/S;
R2ds=R2/S;
else RLd =inf; R2ds=inf; end
Z2=R2ds + j*abs(X2);
if Rc == inf || Rc ==0, Gc = 0; else Gc = 1/Rc; end
if Xm == inf || Xm==0, Bm = 0; else Bm = 1/abs(Xm); end
Y2=1/Z2 ;
Ye=Gc-j*Bm;
if (Gc == 0 && Bm == 0)  
    Ze = inf+j*inf; else Ze = 1/Ye; end
Yf=Y2+Ye;
Zf=1/Yf;  Rf = real(Zf); Xf = imag(Zf);
Zin=Z1+Zf; Rin = real(Zin); Xin = imag(Zin);
if (Gc ~= 0  | Bm) ~= 0
      Zth= Z1*Ze/(Z1+Ze);
      Vthc=V*Ze/(Z1 +Ze);
      else
      Zth=Z1 ;
      Vthc=V ;
      end
Vth=abs(Vthc); Tth = angle(Vthc)*180/pi;
Rth=real(Zth);
Xth=imag(Zth);
Rdd=sqrt(Rth^2 + (Xth+X2)^2);
Smax=R2/Rdd;
Pmax=1.5*Vth^2./(Rth+Rdd);
Tmax=Pmax/Ws;
I1=V/Zin;
I1m=abs(I1);
T1=angle(I1)*180./pi;
%if real(Ze) == inf & imag(Ze) == inf I2 =I1; else
if Rc==inf && Xm==inf, I2=I1; else
I2= Ze*I1/(Ze+Z2); end
T2=angle(I2)*180/pi;
I2m=abs(I2);
Io=I1-I2; Iom=abs(Io); Ao=angle(Io)*180/pi;
Pcore=3*real(Ze)*Iom^2;
S1=3.*V*conj(I1);
SCL=3*R1*I1m^2;
Pin=real(S1);
Pg=3.* R2ds*I2m^2;
RCL=3.*R2*I2m^2;
Pm=Pg-RCL;
Td=Pg/Ws;
I2st = Vth/(Zth+Z2s);
Pgst = 3.*R2*abs(I2st)^2;
Tst = Pgst/Ws;
if S ~= 1
      Po=Pm-Prot;  hp = Po/746;
      To=Po/Wr;
      Ef=100*Po/Pin;
else, end

h0 = figure('Units','normalized', ...
        'PaperUnits','points', ...
       'Position',[0.15  0.09 0.8 0.8], ...
        'Tag','Fig2');
ax1=axes('Position',[0.2 .72   .55 .20]);

% Draw the Thevenin's Equivalent circuit
ths = 0:.0025:pi;
xs1 =1.45+0.075*cos(ths);
ys1 = 1.2 +0.075*sin(ths);
xs2 =1.6+0.075*cos(ths);
xs3 =1.75+0.075*cos(ths);
xs4 =1.9+0.075*cos(ths);
x5 = [0.75 0.75 .8];
y5 =[1.2 1.0 1.0];
x6 = [1.1 1.3 1.3];
y6 = [1.0 1.0  0];
xw = [0.65  0.65  1.4  1.4  0.65];
yw = [0.95  1.35  1.35  0.95  0.95];
% R_c
xr=[.5   .5   .3   .3   .35  .25   .35   .25   .35   .25   .35   .25   .3  .3  .5  .5];
yr=[1.2   1     1  .775 .75  .7    .65   .60   .55   .50   .45   .40   .375 .2 .2  0];
% X_m
thm=-pi/2:.0025:pi/2;
xm=0.7+0.05*cos(thm);
ym=.05*sin(thm);
xxm=[xm     xm      xm  xm] ;
yxm=[.4+ym 0.5+ym 0.6+ym 0.7+ym];
x1=[0.4  .65 .7     .80  0.9   1.0   1.1   1.2   1.25  1.575  ];
y1=[1.2   1.2  1.3    1.1  1.3   1.1   1.3    1.1   1.2  1.2];
plot(x1-1.2, y1,'b', 'erasemode','none')
hold on
axis('equal')
axis off
plot(xs1-1,ys1,'b', xs2-1,ys1, 'b', xs3-1,ys1,'b', xs4-1, ys1,'b') 
xv1=[.3  .7  .7];
yv1=[1   1   .75];
xv2=[.5  .5  .7 .7 ];
yv2=[0  .2   .2  .35];
x21=[3.2-.025  3.6  3.6];
y21=[1.2 1.2  .9];
x22=[-.8  3.6  3.6];
y22=[0  0   .3];
xL2=[3.55  3.55  3.65  3.65  3.55];
yL2=[.3  .9  .9  .3  .3];
plot(x21, y21, 'b',x22, y22,'b')
plot(xL2, yL2,'b')
x2=1.0+[0.6  .65 .7     .80  0.9   1.0   1.1   1.2   1.25  1.575  ];
y2=[1.2   1.2  1.3    1.1  1.3   1.1   1.3    1.1   1.2  1.2];
plot(x2, y2,'b')
plot(1.2+xs1,ys1,'b', 1.2+xs2,ys1, 'b', 1.2+xs3,ys1,'b', 1.2+xs4, ys1,'b') 
xd1=[.9750   1.6];
yd1=[1.2  1.2];
plot(xd1, yd1, 'b') 
text(-.835,1.1625, '\circ', 'color', [0 0 1])
text(-.835,-.0375, '\circ', 'color', [0 0 1])
%text(1.6, .35, 'jX_{m}', 'Fontsize', 10, 'color', [0 0 .675])
%text(.9, .35, 'R_{c}', 'Fontsize', 10, 'color', [0 0 .675])
text(-.34, .975, 'R_{th}', 'Fontsize', 10, 'color', [0 0 .675])
text(.6, 1.05, 'jX_{th}', 'Fontsize', 10, 'color', [0 0 .675])
text(1.85, 1, 'R_2^\prime', 'Fontsize', 10, 'color', [0 0 .675])
text(2.9, 1.05, 'jX_2\prime', 'Fontsize', 10, 'color', [0 0 .675])
%text(5.5, .6, 'V_2', 'Fontsize', 10, 'color', [0 0 .675])
%text(8.75, .6, 'S_{Load}', 'Fontsize', 10, 'color', [0 0 .675])
text(-.2, -.15, 'Thevenin''s Equivalent Circuit per phase', 'color',[0 0 .675])
text(-.5, 1.4, ['Z_{th} = ', num2str(Rth),' + j', num2str(Xth), ' \Omega'], 'Fontsize', 10, 'color', [1 0 0])
text(1.7, 1.4, ['{Z_2}^\prime = ', num2str(R2) ' + j', num2str(abs(X2)), ' \Omega'], 'Fontsize', 10, 'color', [1 0 0])
text(3.7, .75, 'R_L^\prime= {R_2}^\prime(1-s)/s', 'Fontsize', 10, 'color', [1 0 0])
text(3.7, .45, ['{R_L}^\prime = ', num2str(RLd), ' \Omega'], 'Fontsize', 10, 'color', [1 0 0])
text(-1.2, .6, ['V_{\phi (th)} = ', num2str(Vth),'\angle', num2str(Tth) ' V'], 'Fontsize', 10, 'color', [1 0 0])
%text(2.8, 1.4, ['{I_2}^\prime = ', num2str(I2), '\angle', num2str(T2), ' A'], 'Fontsize', 10, 'color', [1 0 0])
text(3.2, 1.4, '{I_2}^\prime \rightarrow', 'color', [1 0 0])
text(-.7, 1.7,['\bfAnalysis of the Equivalent Circuit at Slip s = ',num2str(S)], 'color', [0  0  .675]) 
hold off
% Display the results of theequivalent circuit analysis
ax2=axes('Position',[0.05  .28  .2  .34]);
axis off
hold on
text(0,1.125, ['V_{1(LL)} = ', num2str(Vm), ' V   ', 'R_1 = ', num2str(R1), ' \Omega   ', 'X_1 = ', num2str(X1), ' \Omega   ',...
             'R_2 = ', num2str(R2), ' \Omega   ', 'X_2 = ', num2str(X2), ' \Omega   ', 'R_c = ', num2str(Rc), ' \Omega   ', ...
             'X_m = ', num2str(Xm),' \Omega   '],  'Fontsize', 10, 'color', [0 0 0.77])
text(0, 1.0, ['{I_2}^\prime  = ', num2str(I2m), '\angle', num2str(T2), ' A'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0, .9, ['I_0 = '          , num2str(Iom), '\angle', num2str(Ao), ' A'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,.8, ['I_1 = '          , num2str(I1m), '\angle', num2str(T1), ' A'], 'Fontsize', 10,'color', [0 0 0.77 ]) 
text(0,.7, ['P_{in} = ', num2str(Pin), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,.6, ['P_{cu (stator)} = ', num2str(SCL), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,.5, ['P_{core (stator)}  = ', num2str(Pcore), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,.4, ['P_{ag} = ', num2str(Pg), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,.3, ['P_{cu (rotor)} = ', num2str(RCL), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]) 
text(0,.2, ['T_d = ', num2str(Td), ' N-m'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
if S~=1
text(0,.1, ['P_m = ', num2str(Pm), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0, 0, ['P_{rot} = ', num2str(Prot), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0, -.1, ['P_o = ', num2str(Po), ' W,  ', num2str(hp), ' hp'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,-.2, ['T_o = ', num2str(To), ' N-m'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,-.3 ,['\eta = ', num2str(Ef), ' %'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
%%
text(0,-.4, ['T_{max} = ', num2str(Tmax), ' N-m'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,-.5, ['s_{max} = ', num2str(Smax), ' p.u.'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,-.6, ['T_{st} = ', num2str(Tst), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
elseif S==1
text(0,.1, ['T_{max} = ', num2str(Tmax), ' N-m'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0,.0, ['s_{max} = ', num2str(Smax), ' p.u.'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
text(0, -.1, ['T_{st} = ', num2str(Tst), ' W'], 'Fontsize', 10,'color', [0 0 0.77 ]); 
else, end
% Torque Speed characteristics
slip1 = Smax:-.005:.0001;
if Smax > 1, Smax =1;else,end
slip2 = 1:-.005:Smax;
slip=[slip2, slip1];
np1 = length(slip1);
np2 = length(slip2);
R2d1 = R2./slip1;
R2d2 = R2./slip2;
Z2d1=R2d1+ j*X2*ones(1,np1);
Z2d2=R2d2+ j*X2*ones(1,np2);
I2d1 = Vth./(Zth*ones(1,np1)+Z2d1);
I2d2 = Vth./(Zth*ones(1,np2)+Z2d2);
Pgd1 = 3*R2d1.*abs(I2d1).^2;
Pgd2 = 3*R2d2.*abs(I2d2).^2;
Tdev1 = Pgd1/Ws;
Tdev2 = Pgd2/Ws;
nr1 = Ns*(ones(1,np1)-slip1);
nr2 = Ns*(ones(1,np2)-slip2);
if length(nr2) > 4
   x1= 1.7*nr2(4);
   else x1 = 1.7*nr1(2); end
y1 = 0.86*Tst;
x2 = 0.96*(1- Smax)*Ns; y2 = 0.89*Tmax;
x3 = 0.95*Nr;  y3 =0.93*Td;
fy = 0:Td/20:Td; nf=length(fy);
fx = ones(1,nf)*Nr;
ax3=axes('Position',[0.365  .1  .53  .5]);

plot(nr1, Tdev1, 'm', nr2, Tdev2, 'r', fx, fy,'b'),grid
xlabel('Rotor speed, rpm', 'color', [0 0 0.675])
ylabel('Developed Torque,  N-m' , 'color', [0 0 0.675])
title('Motor torque-speed curve', 'color', [0 0 0.675])
text(x1, y1, 'T_{st}', 'color',[0 0 0.675])
text(x2, y2, 'T_{max}', 'color', [0 0 0.675])
if Nr ~= 0
  text(x3, y3, 'T_d', 'color',[0 0 0.675])
else, end
if S~=1
if S >= Smax
   text(x1,.75*y1, ['s_{max} = ',num2str(Smax), ', s \geq s_{max}'], 'color', [1 0 0])
   text(x1, .5*y1,'Motor cannot operate in this region.', 'color', [1 0 0])
   else, end
   hold off, 
else, end


% --------------------------------------------------------------------
function varargout = pushbuttonInfo_Callback(h, eventdata, handles, varargin)
figure(inductionmotorinfo)
% --------------------------------------------------------------------
function varargout = pushbuttonExit_Callback(h, eventdata, handles, varargin)
close all
