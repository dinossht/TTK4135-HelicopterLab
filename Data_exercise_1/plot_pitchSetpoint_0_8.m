close all
% Measured data

labels_x = {'$\lambda$', '$\dot{\lambda}$'; '$p$', '$\dot{p}$'; '$e$', '$\dot{e}$'};
labels_u = {'$p_c$', '$e_c$'}';
titles = {'Travel', 'Travel rate'; 'Pitch', 'Pitch rate'; 'Elevation', 'Elevation rate'};
measured_data = Data.parse_data('measured_data_pitchSetpoint_0_8.mat');
measured_data = reshape(measured_data, [2, 3])';
input_data = Data.parse_data('input_data_pitchSetpoint_0_8.mat');

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
