r = input("input resistance: ");        % user inputs Resistance and Error
e = input("input absolute relative approximate error percentage: ");

error = -1;

iteration = 0;

TOld = 0;
T = 300;

while (error > e || error < 0)
    TOld = T;
    T = T - equation(T,r)/dequation(T);  % calculating new T
    iteration = iteration + 1;           % incrementing iteration counter
    error = abs((T-TOld)/T)*100;         % calculating error
end

% displaying results
disp("The temperature obtained by newton-raphson is " + T)  
disp("The number of required iterations for newton-raphson is " + iteration)
disp("The absolute relative approximate error % for newton-raphson is " + error)

% function
function [eqn] = equation(T,r)
    A = 3.9083 * 10.^-3;
    B = -5.775 * 10.^-7;
    C = -4.183 * 10.^-12;
    if T < 0
        eqn = 100*(1 + A*T + B*T.^2 + C*(T-100)*T.^3) - r;
    else
        eqn = 100*(1 + A*T + B*T.^2) - r;
    end
end

% derivative of function
function [deqn] = dequation(T)
    A = 3.9083 * 10.^-3;
    B = -5.775 * 10.^-7;
    C = -4.183 * 10.^-12;
    if T < 0
        deqn = 100*(A + 2*B*T + (C*T.^3) + 3*C*(T-100)*T.^2);
    else
        deqn = 100*(A + 2*B*T);
    end
end