function [h, hx, hy] = getDepth(x,y)
    [X,Y] = meshgrid(x,y);
    h = .5*X + exp(-1*((X-2).^2 + (Y-2).^2)); 
    hx = .5 - 2*(X-2).*exp(-1*((X-2).^2 + (Y-2).^2));
    hy = -2*(Y-2).*exp(-1*((X-2).^2 + (Y-2).^2));
end