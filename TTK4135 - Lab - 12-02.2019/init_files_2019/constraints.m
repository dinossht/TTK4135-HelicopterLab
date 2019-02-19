function [ c, ceq ] = constraints( z )
global alpha beta lambda_t mx N
ceq = zeros(N,1);


%% First inequality

    lambda_t = 2*pi/3;
    alpha = 0.2;
    beta = 20;
    c = alpha*exp(-beta*(z(1:mx:N*mx)-lambda_t).^2) - z(5:mx:N*mx);

end

