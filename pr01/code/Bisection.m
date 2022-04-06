function p = Bisection(xT,yT)
    a = 0;
    b = pi/2;
    p = 0;
    tol = 1e-6;
    d = Inf;
    while b-a > tol && d > tol
        p = (b+a)/2;
        overshoot = Distance(xT,yT,p);
        if overshoot > 0
            b = p;
        else
            a = p;
        end
    end
end