function [phantomTop, phantomLeft, phantomRight] = getPhantom(i,j,n,u)
    if i == n
        phantomTop = u(i-1,j);
    else
        phantomTop = u(i+1, j);
    end

    if j == 1
        phantomLeft = u(i, j+1);
        phantomRight = u(i, j+1);
    elseif j == n
        phantomLeft = u(i, j-1);
        phantomRight = u(i, j-1);
    else
        phantomLeft = u(i, j-1);
        phantomRight = u(i, j+1);
    end
end