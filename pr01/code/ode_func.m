function dy = ode_func(x,y)
    g = 9.81; % m/s^2
    d = 0.002; % m^-1
    v = sqrt(y(1)^2+y(2)^2);
    dy = zeros(4,1);
    dy(1) = -d*v;
    dy(2) = (-d*v*y(2)-g)/y(1);
    dy(3) = 1/y(1);
    dy(4) = y(2)/y(1);
end

