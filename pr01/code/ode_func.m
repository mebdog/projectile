% This function finds the slope based on the current differential equation
% values.
% Connor Horn and Barak Morris
% 4/1/22
% APPM 3050, Project 1
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
    
    dv = 0;
    dt = 0;
    for i = 1:length(alpha)
        d = get_distance(x, y, xi(i), yi(i));
        F = alpha(i)/d^3;
        dv = dv + F*((x-xi(i))*cos(theta) + (y-yi(i))*sin(theta));
        dt = dt + (F/v)*(-(x-xi(i))*sin(theta) + (y-yi(i))*cos(theta));
    end

    dy = zeros(4,1);
    dy(1) = v*cos(theta); % x'
    dy(2) = v*sin(theta); % y'
    dy(3) = -cd*v^2 - g*sin(theta) + dv; %v'
    dy(4) = -g/v*cos(theta) + dt; % theta'
end

