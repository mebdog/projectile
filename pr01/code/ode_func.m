function dy = ode_func(t,y)
    g = 9.81; % m/s^2
    cd = 0.002; % m^-1
    dy = zeros(4,1);
    dy(1) = y(3)*cos(y(4)); % x'
    dy(2) = y(3)*sin(y(4)); % y'
    dy(3) = -cd*y(3)^2-g*sin(y(4)); %v'
    dy(4) = -g/y(3)*cos(y(4)); % theta'
end

