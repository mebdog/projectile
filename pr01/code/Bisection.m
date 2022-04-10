% This function applies bisection method to the projectile fired and
% determines the optimal angle.
% Connor Horn and Barak Morris
% 4/1/22
% APPM 3050, Project 1
function p = Bisection(xT,yT)
    a = 0;
    b = pi/2;
    p = 0;
    tol = 1e-6;
    while b-a > tol
        p = (b+a)/2;
        overshoot = Distance(xT,yT,p);
        if overshoot > 0
            b = p;
        else
            a = p;
        end
    end
end