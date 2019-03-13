%% Calculate theoretical optimal path without feedback

%run('template_problem_2.m');

d = Data.parse_data([t;x1';x2';x3';x4';x5';x6']);

D = Data.combine(d, {'$x_1$', '$x_2$', '$x_3$', '$x_4$', '$x_5$', '$x_6$'});

p = Plotex(D);
p.enable('grid');
modes = {'plot', 'plot', 'plot', 'plot','stairs','plot'}';
p.subplot(modes);
