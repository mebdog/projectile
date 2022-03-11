function y0 = Initialize(angle,magnitude)
    vx = magnitude*cos(angle);
    vy = magnitude*sin(angle);
    y0 = [vx,vy,1/vx,vy/vx];
end

