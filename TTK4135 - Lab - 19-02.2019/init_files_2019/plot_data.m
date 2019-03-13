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
%%
figure(1); 
plot(time_data,input_data(p_ref_i,:)); hold on;
plot(time_data,measured_data(p_i,:));
title('Pitch angle');
legend('input','measured');

figure(2); 
plot(time_data,measured_data(t_i,:));
title('Travel angle');
legend('measured');

figure(3); 
plot(time_data,input_data(e_ref_i,:)); hold on;
plot(time_data,measured_data(e_i,:));
title('Elevation angle');
legend('input', 'measured');

figure(4); 
plot(time_data,measured_data(p_r_i,:));
title('Pitch angle rate');
legend('measured');
%%
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

qp_input_filename = 'qp_input_data.mat';
qp_state_filename = 'qp_state_data.mat';
qp_input_data = load(qp_input_filename);
qp_input_data = qp_input_data.measured_data;
qp_state_data = load(qp_state_filename);
qp_state_data = qp_state_data.measured_data;
time_data = qp_input_data(1,:);

t_qp_i = 2; t_qp_r_i = 3; p_qp_i = 4; p_qp_r_i = 5;  e_qp_i = 6; e_qp_r_i = 7;
up_qp_i = 2; ue_qp_i = 3;

figure(4); 
plot(time_data,input_data(p_ref_i,:)); hold on;
plot(time_data,qp_input_data(up_qp_i,:)); hold on;
legend('input','qp input');
title('Pitch input');

figure(5); 
plot(time_data,measured_data(p_i,:)); hold on;
plot(time_data,qp_state_data(p_qp_i,:));
title('Pitch angle');
legend('measured','qp state');

figure(6); 
plot(time_data,measured_data(t_i,:)); hold on;
plot(time_data,qp_state_data(t_qp_i,:));
title('Travel angle');
legend('measured','qp state');

figure(7);
plot(time_data,measured_data(t_r_i,:)); hold on;
plot(time_data,qp_state_data(t_qp_r_i,:));
title('Travel angle rate');
legend('measured','qp state');

figure(8); 
plot(time_data,measured_data(e_i,:)); hold on;
plot(time_data,qp_state_data(e_qp_i,:));
title('Elevation angle');
legend('measured','qp state');

figure(9); 
plot(time_data,input_data(e_ref_i,:)); hold on;
plot(time_data,qp_input_data(up_qp_i,:)); hold on;
title('Elevation input');
legend('input','qp input');

figure(10); 
plot(time_data,measured_data(e_r_i,:)); hold on;
plot(time_data,qp_state_data(e_qp_r_i,:)); hold on;
title('Elevation angle dot');
legend('input','qp input');
%% Fix plot for the other states as well
