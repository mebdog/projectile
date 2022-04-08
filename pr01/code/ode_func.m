function dy = ode_func(t,Y)
    g = 9.81; % m/s^2
    cd = 0.002; % m^-1

    struct = Sensors();
    alpha = struct(:,1);
    xi = struct(:,2);
    yi = struct(:,3);

    x = Y(1);
    y = Y(2);
    v = Y(3);
    theta = Y(4);
    
    Fx = 0;
    Fy = 0;
    for i = 1:length(alpha)
        d = get_distance(x, y, xi(i), yi(i));
        F = alpha(i)/d^3;
        phi = get_angle(x,y,xi(i),yi(i));
        Fx = Fx + F*cos(phi);
        Fy = Fy + F*sin(phi);
    end

    dy = zeros(4,1);
    dy(1) = v*cos(theta); % x'
    dy(2) = v*sin(theta); % y'
    dy(3) = -cd*v^2 + (Fy-g)*sin(theta) + Fx*cos(theta); %v'
    dy(4) = ((Fy-g)*cos(theta) - Fx*sin(theta))/v; % theta'
end

