% This function finds the dot product between the velocity and the distance
% between the target to stop integrating.
% Connor Horn and Barak Morris
% 4/1/22
% APPM 3050, Project 1
function [value, isterminal, direction] = event(t,y,xTarget,yTarget)
    %value is dot product between velocity and distance from target
    %vcos0(x-xT) + vsin0(y-yT) = 0 => minimum distance
    value = y(3)*cos(y(4))*(y(1)-xTarget) + y(3)*sin(y(4))*(y(2)-yTarget);
    %value = y(2);
    isterminal = 1; %stop integrating
    direction = 0;
end