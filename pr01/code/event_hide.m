function [value, isterminal, direction] = event_hide(t,y)
    value = [y(1) y(2)];
    isterminal = [1 1]; %stop integrating
    direction = 0;
end