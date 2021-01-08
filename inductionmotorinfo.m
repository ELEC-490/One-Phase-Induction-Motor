function varargout = inductionmotorinfo(varargin)

% Last Modified by GUIDE v2.5 25-Apr-2012 14:16:38

if nargin == 0  % LAUNCH GUI

fig = openfig(mfilename,'new');

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

axes(handles.axesInfo)    % Select the proper axes
axis off
str1(1) = {'\bf Induction Motor Program'};

str2(1)= {['Among the important aspects in the steady-state analysis of a three-phase induction motor are     '
           'the variation of current, power, losses and torque associated with various operating conditions.  '
           'In this GUI program the parameters of the equivalent circuit can be entered on the circuit        '
           'diagram. The program draws the Thévenin\primes equivalent circuit. Performance characteristics    '
           'are then obtained for the specified slip and the torque slip curve is plotted on the screen.      '
           'The analysis can be repeated for different slips.                                                 '                                            
           '                                                                                                  '
           'V_{th} = V_{1\phi} Z_{sh}/(Z_1+Z_{sh}),    where  Z_{sh} = (jX_m)(R_c)/(R_c+jX_m)                 '
           'Z_{th} = Z_1\timesZ_{sh}/(Z_1+Z_{sh})                                                             '
           'The referred rotor current, I_2\prime = V_{th}/[R_{th}+R_2\prime/s + j(X_{th}+X_2\prime]          '
           'Stator current, I_1 = I_2(Z_{sh}+Z_2)/Z_{sh}                                                      '
           'No-load current I_o = I_1 - I_2\prime                                                             '
           'Air-gap power, P_{ag} = 3R_2\prime |I_2\prime|^2                                                  '
           'Developed torque, T_d = P_{ag}/\omega_s                                                           '
           'Gross mechanical power, P_m =  (1-s)P_{ag}                                                        '
           'Rotor copper loss, P_{cu(rotor)} = s P_{ag}                                                       '
           'Stator copper loss, P_{cu(stator)} = 3 R_1|I_1|^2                                                 '
           'Stator core loss, P_{c(stator)} = 3 Real(Z_{sh})|I_o|^2                                           '
           'P_i = P_{ag} + P_{cu(statror)} + P_{c(stator)}                                                    '
           'Output power, P_o = P_m - P_{rot}                                                                 '
           'Input power, P_i = P_{ag} + P_{cu(stator)} +  P_{c(stator)}                                       '
           'Efficiency, \eta = P_0/P_I                                                                        '                                   
           'S_{max T} = R_2\prime/[R_{th}^2 + (X_{th} + X_2\prime)^2]^{0.5}                                   ']};

        
        
text(0.2,  1,  str1, 'FontSize', 14, 'color', [0 0 0.502]) 
text(0,  .5, str2, 'FontSize', 10, 'color', [0 0 0.502]) 

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
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)

close
