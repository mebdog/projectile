v0 = 1500; % m/s
theta = pi/4; % radians
y0 = [0,0,v0,theta]; % x, y, v, theta
%target values
xT = 750;
yT = 1000;

tic
disp(Bisection(xT,yT));
toc
%only integrates until it gets closest
options = odeset('Events', @(t,y) event(t,y,xT,yT));
[X,Y] = ode45(@ode_func, 0:.0001:300, y0, options);
d = (Y(end,1)-xT).^2 + (Y(end,2)-yT).^2;
%minDistance = (Y(end,1)-xT).^2 + (Y(end,2)-yT).^2;

%disp(minDistance);

%get z value of cross product to determine if over or under shot
%overshoot = Y(end,3)*cos(Y(end,4))*(Y(end,2)-yT) - Y(end,3)*sin(Y(end,4))*(Y(end,1)-xT);

%if overshoot > 0
%    disp('overshoot');
%else
%    disp('undershoot');
%end
struct = Sensors();
alpha = struct(:,1);
xi = struct(:,2);
yi = struct(:,3);

plot(Y(:,1),Y(:,2))
hold on;
plot(xT,yT,'.')
hold on;

for i =1:length(alpha)
    plot(xi(i),yi(i),'.')
    hold on;
end

hold off;
xlabel("X (m)")
ylabel("Y (m)")
title("X, Y vs time (t)")