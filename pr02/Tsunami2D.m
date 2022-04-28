% This script simulates a wave with non-uniform depth
% Connor Horn and Barak Morris
% 4/27/22
% APPM 3050, Project 2

load('AKWaterColormap','AKWaterColormap')
set(gcf,'Colormap',AKWaterColormap)

deltaX = .01;
deltaT = .01;
c = 1;
lam = (c*deltaT/deltaX)^2;

nFrames = 400;

xLeft = 0;
xRight = 4;
yLeft = 0;
yRight = 4;
y = linspace(yLeft, yRight, 201);
x = linspace(xLeft, xRight, 201);
n = length(x);
uPast = zeros(n,n);
uCur = zeros(n,n);
uFut = zeros(n,n);

[h, hx, hy] = getDepth(x,y);
constantTop = lam*(h+hx*deltaX/2); %u(i+1,j)
constantBottom = lam*(h-hx*deltaX/2); %u(i-1,j)
constantLeft = lam*(h-hy*deltaX/2); %u(i,j-1)
constantRight = lam*(h+hy*deltaX/2);%u(i,j+1)
constantCurrent = 2-4*lam*h; %u(i,j)

kk = [.5,.8,.5,.5];
ss = [1000,1000,1000];
surfl(x,y,uCur,ss,kk), xlabel('X axis'), ylabel('Y axis'),
                 title('Wave'), axis([0 4 0 4 -1 2]),
                 shading interp
drawnow

for t = 1:nFrames
    for j = 1:n
        for i = 1:n
            if i == 1
                uFut(i,j) = leftBoundary(t, deltaT);
            % Corner Cases
            elseif i == n && j == 1
                uFut(i,j) = constantTop(i,j)*uCur(i,j) + constantBottom(i,j)*uCur(i-1,j) + ...
                            constantLeft(i,j)*uCur(i,j) + constantRight(i,j)*uCur(i,j+1) + ...
                            constantCurrent(i,j)*uCur(i,j) - uPast(i,j);
            elseif i == n && j == n
                uFut(i,j) = constantTop(i,j)*uCur(i,j) + constantBottom(i,j)*uCur(i-1,j) + ...
                            constantLeft(i,j)*uCur(i,j-1) + constantRight(i,j)*uCur(i,j) + ...
                            constantCurrent(i,j)*uCur(i,j) - uPast(i,j);
            % Edge Cases
            elseif i == n
                uFut(i,j) = constantTop(i,j)*uCur(i,j) + constantBottom(i,j)*uCur(i-1,j) + ...
                            constantLeft(i,j)*uCur(i,j-1) + constantRight(i,j)*uCur(i,j+1) + ...
                            constantCurrent(i,j)*uCur(i,j) - uPast(i,j);
            elseif j == 1
                uFut(i,j) = constantTop(i,j)*uCur(i+1,j) + constantBottom(i,j)*uCur(i-1,j) + ...
                            constantLeft(i,j)*uCur(i,j) + constantRight(i,j)*uCur(i,j+1) + ...
                            constantCurrent(i,j)*uCur(i,j) - uPast(i,j);
            elseif j == n
                uFut(i,j) = constantTop(i,j)*uCur(i+1,j) + constantBottom(i,j)*uCur(i-1,j) + ...
                            constantLeft(i,j)*uCur(i,j-1) + constantRight(i,j)*uCur(i,j) + ...
                            constantCurrent(i,j)*uCur(i,j) - uPast(i,j);
            else
                uFut(i,j) = constantTop(i,j)*uCur(i+1,j) + constantBottom(i,j)*uCur(i-1,j) + ...
                            constantLeft(i,j)*uCur(i,j-1) + constantRight(i,j)*uCur(i,j+1) + ...
                            constantCurrent(i,j)*uCur(i,j) - uPast(i,j);
            end
            if(abs(uFut(i,j)) > 1)
                uFut(i,j) = 1;
            end
        end
    end
    
    surfl(x,y,uCur,ss,kk), xlabel('X axis'), ylabel('Y axis'),
                 title('Wave'), axis([0 4 0 4 -1 2]),
                 shading interp
    drawnow
    uPast = uCur;
    uCur = uFut;
end