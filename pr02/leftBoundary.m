function u = leftBoundary(t, deltaT)
    % returns single scalar value for left hand displacement
    if ( t < 0.5/deltaT )
        u = 1.0 * sin(2*pi*t*deltaT);
    else
        u = 0;
    end
end