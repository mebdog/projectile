% This script returns the depth and the partial derivative of the depth
% with respect to our x and y values
% Connor Horn and Barak Morris
% 4/27/22
% APPM 3050, Project 2

function [h, hx, hy] = getDepth(x,y)
    [X,Y] = meshgrid(x,y);
    X = X';
    Y = Y';
    h = 2 - .5*X - exp(-1*((X-2).^2 + (Y-2).^2)); 
    hx = -.5 + 2*(X-2).*exp(-1*((X-2).^2 + (Y-2).^2));
    hy = 2*(Y-2).*exp(-1*((X-2).^2 + (Y-2).^2));
end