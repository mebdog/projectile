v0 = 1500; % m/s
theta = pi/4; % radians
y0 = [0,0,v0,theta]; % x, y, v, theta
%target values
xT = 400;
yT = 400;

%only integrates until it gets closest
options = odeset('Events', @(t,y) event(t,y,xT,yT));

[X,Y] = ode45(@ode_func,0:.0001:30,y0, options);

minDistance = (Y(end,1)-xT).^2 + (Y(end,2)-yT).^2;

disp(minDistance);

%get z value of cross product to determine if over or under shot
overshoot = Y(end,3)*cos(Y(end,4))*(Y(end,2)-yT) - Y(end,3)*sin(Y(end,4))*(Y(end,1)-xT);

if overshoot > 0
    disp('overshoot');
else
    disp('undershoot');
end


plot(Y(:,1),Y(:,2))
hold on;
plot(xT,yT,'.')
hold off;
xlabel("X (m)")
ylabel("Y (m)")
title("X, Y vs time (t)")