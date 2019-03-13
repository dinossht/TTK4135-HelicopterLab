
for i = -1:1
    Q1 = zeros(mx,mx);
    q = 10^i;
    Q1(1,1) = 2*10^i;                            % Weight on state x1                    % *
    Q1(2,2) = 0;                            % Weight on state x2                    % *
    Q1(3,3) = 0;                            % Weight on state x3                    % *
    Q1(4,4) = 0;                            % Weight on state x4                    % * 
    run('template_problem_2.m');
end

