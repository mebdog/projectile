function [value, isterminal, direction] = event_y(t,y,xT,yT)
    value = y(2);
    isterminal = 1;
    direction = 0;
end