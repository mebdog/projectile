% This function returns the distance between two points.
% Connor Horn and Barak Morris
% 4/1/22
% APPM 3050, Project 1
function d = get_distance(x,y,xi,yi)
    d = sqrt((x-xi)^2 + (y-yi)^2);
end