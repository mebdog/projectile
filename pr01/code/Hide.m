theta = .01;
tspan = [0,9999];
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

