r = input("input resistance: ");
e = input("input absolute relative approximate error percentage: ");

error = -1;
f = true;
Tmold = 0;
iter = 0;

Tl = 0;
Tu = 300;

while (error > e || error < 0)
    Tm = (Tl + Tu)/2;

    error = abs((Tm-Tmold)/Tm)*100;

    iter = iter + 1;

    if (Tl < 0); rl = eqn1(Tl,r); else; rl = eqn2(Tl,r); end
    if (Tu < 0); ru = eqn1(Tu,r); else; ru = eqn2(Tu,r); end
    if (Tm < 0); rm = eqn1(Tm,r); else; rm = eqn2(Tm,r); end
    
    if (rl * rm < 0)
        Tu = Tm;
    elseif (rm * ru < 0)
        Tl = Tm;
    elseif (rl == 0)
        disp("The temperature obtained by bisection is " + Tl)
        break
    elseif (rm == 0)
        disp("The temperature obtained by bisection is " + Tm)
        break
     elseif (ru == 0)
        disp("The temperature obtained by bisection is " + Tu)
        break
    else
        disp("no root")
        break
    end
    Tmold = Tm;
end

disp("The temperature obtained by bisection is " + Tm)
disp("The number of required iterations for bisection is " + iter)
disp("The absolute relative approximate error % for bisection is " + error)

function [eqnn] = eqn1(T,r)
    A = 3.9083 * 10.^-3;
    B = -5.775 * 10.^-7;
    C = -4.183 * 10.^-12;
    eqnn = 100*(1 + A*T + B*T.^2 + C*(T-100)*T.^3) - r;
end
function [eqnp] = eqn2(T,r)
    A = 3.9083 * 10.^-3;
    B = -5.775 * 10.^-7;
    eqnp = 100*(1 + A*T + B*T.^2) - r;
end