% This program arcs through theta in increments of .01 and graphs the
% projectile path to determine where you can hide.
% Connor Horn and Barak Morris
% 4/1/22
% APPM 3050, Project 1
theta = .01;
tspan = [0,15];
options = odeset('Events', @event_hide);

struct = Sensors();
alpha = struct(:,1);
xi = struct(:,2);
yi = struct(:,3);

for i =1:length(alpha)
    plot(xi(i),yi(i),'.')
    hold on;
end

while theta < pi/2
    y0 = [0,0,1500,theta];
    [X,Y] = ode45(@ode_func, tspan, y0, options);
    theta = theta + .01;
    disp(theta);
    plot(Y(:,1),Y(:,2))
    hold on;
end
xlabel("x (m)")
ylabel("y (m)")
title("Attractor at (700,500) Repulsor at (400,800)")


