% This script inputs the boundary conditions for our wave
% Connor Horn and Barak Morris
% 4/27/22
% APPM 3050, Project 2

function u = leftBoundary(t, deltaT)
    % returns single scalar value for left hand displacement
    if ( t < 0.5/deltaT )
        u = 1.0 * sin(2*pi*t*deltaT);
    else
        u = 0;
    end
end