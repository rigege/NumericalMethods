r = input("input resistance: ");        % user inputs Resistance and Error
e = input("input absolute relative approximate error percentage: ");

error = -1;

iteration = 0;

TOld = 0;
T = 300;

while (error > e || error < 0)

    TOld = T;
    T = equation(T,r);          % setting new T
    iteration = iteration + 1;
    error = abs((T-TOld)/T)*100;    % calculating error

end

% displaying results
disp("The temperature obtained by fixed-point iteration is " + T)  
disp("The number of required iterations for fixed-point is  " + iteration)
disp("The absolute relative approximate error % for fixed-point is " + error)

% function
function [eqn] = equation(T,r)
    A = 3.9083 * 10.^-3;
    B = -5.775 * 10.^-7;
    C = -4.183 * 10.^-12;
    if T < 0
        eqn = (100 + 100*B*T.^2 + 100*C*(T-100)*T.^3 - r)/(A*-100);
    else
        eqn = (100 + 100*B*T.^2 - r)/(A*-100);
    end
end