v0 = 1500; % m/s
theta = pi/4; % radians
y0 = [0,0,v0,theta]; % x, y, v, theta

[X,Y] = ode45(@ode_func,0:.0001:30,y0);

plot(Y(:,1),Y(:,2))
xlabel("X (m)")
ylabel("Y (m)")
title("X, Y vs time (t)")