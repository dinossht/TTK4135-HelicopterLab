%% Set up

clear 
close all
clc

addpath('./Data_exercise_1/');
addpath('./Data_exercise_2/');
addpath('./Data_exercise_3/');
addpath('./Data_exercise_4/');

%% Exercise 1

% run('plot_elevSetpoint_0_52.m');
% run('plot_pitchSetpoint_0_8.m');
% run('plot_pitchSetpoint_0_175.m');
% run('plot_pitchSetpoint_1_0472.m');
% run('plot_zeroSetpoint.m');

%% Exercise 2
 
% run('plot_exercise_2_4.m');
% run('plot_qp.m');

%% Exercise 3

close all;

% Measured data

labels_x = {'$\lambda$', '$\dot{\lambda}$'; '$p$', '$\dot{p}$'; '$e$', '$\dot{e}$'};
labels_u = {'$p_c$', '$e_c$'}';
titles = {'Travel', 'Travel rate'; 'Pitch', 'Pitch rate'; 'Elevation', 'Elevation rate'};
measured_data = Data.parse_data('measured_data_part3.mat');
measured_data = reshape(measured_data, [2, 3])';
input_data = Data.parse_data('input_data_part3.mat');

D = Data.combine(measured_data, labels_x);
D_u = Data.combine(input_data, labels_u);

D(2,1) = {[D(2, 1); D_u(1)]};
D(3,1) = {[D(3, 1); D_u(2)]};

[r_D, c_D] = size(D);

p = cell(r_D, c_D);

for i = 1:r_D
    for j = 1:c_D
        p{i, j} = Plotex(D{i, j}, 'ylabel', strcat(labels_x{i, j}, '~[rad]'), 'title', titles{i, j}, 'xlabel', '$t$ [s]');
        p{i, j}.font_size.ticklabel = 11;
        p{i, j}.enable('grid');
        p{i, j}.enable('title');
        p{i, j}.enable('ylabel');
        p{i, j}.enable('xlabel');
    end
end

for i = 1:c_D
    p{r_D, i}.enable('xlabel');
end

    sp = Subplotex([p(1,1), p(2,1)], 'States');
    sp.plot();
    
%% Exercise 4

close all;

% Measured data

labels_x = {'$\lambda$', '$\dot{\lambda}$', '$p$', '$\dot{p}$', '$e$', '$\dot{e}$'}';
titles = {'Travel', 'Travel rate', 'Pitch', 'Pitch rate', 'Elevation', 'Elevation rate'};
measured_data = Data.parse_data('measured_data_part3.mat');

%measured_data = [measured_data(1,1), measured_data(1,2); measured_data(2,1), measured_data(2,2); measured_data(3,1), measured_data(3,2)];

D = Data.combine(measured_data(1:4), labels_x);

p = cell(length(D), 1);

for i = 1:length(D)
    p{i} = Plotex(D(i), 'ylabel', labels_x{i}, 'title', titles{i}, 'xlabel', '$t$');
    p{i}.font_size.ticklabel = 11;
    p{i}.disable('figure');
    p{i}.enable('grid');
end
    %p{end} = Plotex(D(end), 'ylabel', labels{end}, 'xlabel', '$t$', 'title', '');
    %p{end}.font_size.ticklabel = 11;
    %p{end}.disable('figure');
    P = {p{1}, p{2}; p{3}, p{4}};%; p{5}, p{6}};
    fig1 = figure(1);
   
    k = 1;
    N = 2;
    M = 2;
    
for i = 1:N
    for j = 1:M
        subplot(N, M, k);
        P{i, j}.plot();
        k = k + 1;
    end
end
    
    sgtitle(fig1, 'Measured states');
    %P.plot2pdf();

% Input data
%fig2 = figure(2);

labels_x = {'$p_c$'};%, '$e_c$'};
titles = labels_x;
input_data = Data.parse_data('input_data_part3.mat');

%measured_data = [measured_data(1,1), measured_data(1,2); measured_data(2,1), measured_data(2,2); measured_data(3,1), measured_data(3,2)];

D = Data.combine(input_data(1), labels_x);

p = Plotex(D, 'title', 'Input $u$', 'ylabel', titles{1}, 'xlabel', 't');
p.enable('grid');
p.plot();

% p = cell(length(D), 1);
% 
% for i = 1:length(D)
%     p{i} = Plotex(D(i), 'ylabel', labels{i}, 'title', titles{i}, 'xlabel', '$t$');
%     
%     p{i}.font_size.ticklabel = 11;
%     p{i}.disable('figure');
%     p{i}.enable('grid');
% end
% 
% 
%     %p{end} = Plotex(D(end), 'ylabel', labels{end}, 'xlabel', '$t$', 'title', '');
%     %p{end}.font_size.ticklabel = 11;
%     %p{end}.disable('figure');
%     P = {p{1}};%, p{2}};
%     %P.fig = figure(1);
%    
%     k = 1;
%     
% for i = 1:1
%     for j = 1:2
%         subplot(1, 2, k);
%         P{i, j}.plot();
%         k = k + 1;
%     end
% end
%    sgtitle(fig2, 'Feedback input');
%    P.plot2pdf();
%%

close all;

% Measured data closed loop

labels_x = {'$\lambda$', '$\dot{\lambda}$', '$p$', '$\dot{p}$', '$e$', '$\dot{e}$'}';
titles = {'Travel', 'Travel rate'; 'Pitch', 'Pitch rate'; 'Elevation', 'Elevation rate'};
measured_data = Data.parse_data('measured_data_p4_closed_loop.mat');

D = Data.combine(measured_data, labels_x);

D = [D(1), D(2); D(3), D(4); D(5), D(6)];

labels_x = reshape(labels_x, [2, 3])';

% measured_data = [measured_data(1), measured_data(2); measured_data(3), measured_data(4); measured_data(5), measured_data(6)];

[r, c] = size(D);

P = cell(r, c);

for i = 1:r
    for j = 1:c
        P{i, j} = Plotex(D(i, j), 'ylabel', labels_x{i, j}, 'title', titles{i, j}, 'xlabel', '$t$');
        P{i, j}.font_size.ticklabel = 11;
        P{i, j}.disable('figure');
        P{i, j}.enable('grid');
    end
end
    %p{end} = Plotex(D(end), 'ylabel', labels{end}, 'xlabel', '$t$', 'title', '');
    %p{end}.font_size.ticklabel = 11;
    %p{end}.disable('figure');
    % P = {p{1}, p{2}; p{3}, p{4}; p{5}, p{6}};
    fig1 = figure(1);
   
    k = 1;
    
    N = 3;
    M = 2;
    
for i = 1:N
    for j = 1:M
        subplot(N, M, k);
        P{i, j}.plot();
        k = k + 1;
    end
end
    
    sgtitle(fig1, 'Measured data, closed loop');
    %P.plot2pdf();

    
%%

close all;

% Measured data closed loop

labels_x = {'$\lambda$', '$\dot{\lambda}$', '$p$', '$\dot{p}$', '$e$', '$\dot{e}$'}';
titles = {'Travel', 'Travel rate'; 'Pitch', 'Pitch rate'; 'Elevation', 'Elevation rate'};
measured_data = Data.parse_data('measured_data_p4_open_loop.mat');

D = Data.combine(measured_data, labels_x);

D = [D(1), D(2); D(3), D(4); D(5), D(6)];

labels_x = reshape(labels_x, [2, 3])';

% measured_data = [measured_data(1), measured_data(2); measured_data(3), measured_data(4); measured_data(5), measured_data(6)];

[r, c] = size(D);

P = cell(r, c);

for i = 1:r
    for j = 1:c
        P{i, j} = Plotex(D(i, j), 'ylabel', labels_x{i, j}, 'title', titles{i, j}, 'xlabel', '$t$');

        P{i, j}.disable('figure');
        P{i, j}.enable('grid');
    end
end
    %p{end} = Plotex(D(end), 'ylabel', labels{end}, 'xlabel', '$t$', 'title', '');
    %p{end}.font_size.ticklabel = 11;
    %p{end}.disable('figure');
    % P = {p{1}, p{2}; p{3}, p{4}; p{5}, p{6}};
    fig1 = figure(1);
   
    k = 1;
    
    N = 3;
    M = 2;
    
for i = 1:N
    for j = 1:M
        subplot(N, M, k);
        P{i, j}.plot();
        k = k + 1;
    end
end
    
    sgtitle(fig1, 'Measured data, open loop');
    %P.plot2pdf();

    
    %% 
% Input data
fig2 = figure(2);

labels_x = {'$p_c$'};%, '$e_c$'};
titles = labels_x;
input_data = Data.parse_data('qp_input_data_part3.mat');

%measured_data = [measured_data(1,1), measured_data(1,2); measured_data(2,1), measured_data(2,2); measured_data(3,1), measured_data(3,2)];

D = Data.combine(input_data, labels_x);

p = cell(length(D), 1);

for i = 1:length(D)
    p{i} = Plotex(D(i), 'ylabel', labels_x{i}, 'title', titles{i}, 'xlabel', '$t$');

    p{i}.disable('figure');
    p{i}.enable('grid');
end


    %p{end} = Plotex(D(end), 'ylabel', labels{end}, 'xlabel', '$t$', 'title', '');
    %p{end}.font_size.ticklabel = 11;
    %p{end}.disable('figure');
    P = {p{1}, p{2}};
    %P.fig = figure(1);
   
    N = 1;
    M = 1;
    
    k = 1;
    
for i = 1:N
    for j = 1:M
        subplot(N, M, k);
        P{i, j}.plot();
        k = k + 1;
    end
end
    sgtitle(fig2, 'QP input');
    P.plot2pdf();
