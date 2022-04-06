theta = .01;
tspan = [0,9999];
options = odeset('Events', @event_hide);
while theta < pi/2
    y0 = [0,0,1500,theta];
    [X,Y] = ode45(@ode_func, tspan, y0, options);
    theta = theta + .01;
    %disp(theta);
    plot(Y(:,1),Y(:,2))
    hold on;
end