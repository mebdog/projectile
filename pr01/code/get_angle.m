function phi = get_angle(x,y,xi,yi)
    phi = atan((y-yi)/(x-xi));
    if x > xi
        phi = phi + pi;
    end
end