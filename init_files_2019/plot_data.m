close all;
input_filename = 'input_data.mat';
measured_filename = 'measured_data.mat';
input_data = load(input_filename); 
input_data = input_data.input_data;
measured_data = load(measured_filename);
measured_data = measured_data.measured_data;
time_data = input_data(1,:);

% ToFile indices
% Measured data indices
t_i = 2; t_r_i = 3; p_i = 4; p_r_i = 5; e_i = 6; e_r_i = 7;
% Input data indices
p_ref_i = 2; e_ref_i = 3;

figure(1); 
plot(time_data,input_data(p_ref_i,:)); hold on;
plot(time_data,measured_data(p_i,:));
title('Pitch angle');
legend('measured', 'input');

figure(2); 
plot(time_data,measured_data(t_i,:));
title('Travel angle');
legend('input');

figure(3); 
plot(time_data,input_data(e_ref_i,:)); hold on;
plot(time_data,measured_data(e_i,:));
title('Elevation angle');
legend('measured', 'input');