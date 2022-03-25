v0 = 1500; % m/s
theta = pi/4;
y0 = [0,0,v0,theta]; % x, y, v, theta
obs = Sensors;

[X,Y] = ode45(@ode_func,0:.0001:30,y0);

hold on
plot(obs(:,2),obs(:,3),'.')
plot(Y(:,1),Y(:,2))