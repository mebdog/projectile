function isovershoot =  Distance(xT,yT,theta)
    v0 = 1500;
    y0 = [0,0,v0,theta]; %intial conditions
    
    tspan = [0,9999];
   
    opt = odeset("Events", @(t,y) event(t,y,xT,yT));
    %grab sensors here from Sensors.m and pass to ode system
    [~,y] = ode45(@ode_func, tspan, y0, opt);
    
    overshoot = cross([y(end,3)*cos(y(end,4)) y(end,3)*sin(y(end,4)) 0],[y(end,1)-xT y(end,2)-yT 0]);
    isovershoot = overshoot(3) > 0;
    %isovershoot = y(end,2)-yT;
end