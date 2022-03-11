v0 = 1500; % m/s
theta = pi/4;
y0 = Initialize(theta,v0);
obs = Sensors;

[X,Y] = ode45(@ode_func,0:1550,y0);

largePositiveIndices = (obs(:,1) >= 7) & (obs(:,1) <= 10);
mediumPositiveIndices = (obs(:,1) >= 3) & (obs(:,1) < 7);
smallPositiveIndices = (obs(:,1) > 0) & (obs(:,1) < 3);
smallNegativeIndices = (obs(:,1) < 0) & (obs(:,1) > -3);
mediumNegativeIndices = (obs(:,1) <= -3) & (obs(:,1) > -7);
largeNegativeIndices = (obs(:,1) <= -7) & (obs(:,1) >= -10);
xValues = obs(:,2);
yValues = obs(:,3);
hold on
plot(X,Y(:,4))
plot(xValues(largePositiveIndices),yValues(largePositiveIndices),'r.','MarkerSize',24)
plot(xValues(mediumPositiveIndices),yValues(mediumPositiveIndices),'r.','MarkerSize',18)
plot(xValues(smallPositiveIndices),yValues(smallPositiveIndices),'r.','MarkerSize',12)
plot(xValues(smallNegativeIndices),yValues(smallNegativeIndices),'b.','MarkerSize',12)
plot(xValues(mediumNegativeIndices),yValues(mediumNegativeIndices),'b.','MarkerSize',18)
plot(xValues(largeNegativeIndices),yValues(largeNegativeIndices),'b.','MarkerSize',24)