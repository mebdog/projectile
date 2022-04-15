deltaX = .01;
deltaT = .01;
c = 1;
lam = (c*deltaT/deltaX)^2;
alpha = 0;
beta = 1;
gamma = 0;

nFrames = 400;

xLeft = 0;
xRight = 4;
yLeft = 0;
yRight = 4;
y = linspace(yRight, yLeft, 201);
x = linspace(xRight, xLeft, 201);
n = length(x);
uPast = zeros(n,n);
uCur = zeros(n,n);
uFut = zeros(n,n);

mesh(x,y,uCur);
drawnow
for t = 1:50
    for j = 1:n
        for i = 1:n
            if i == 1
                uFut(i,j) = leftBoundary(t, deltaT);
            elseif i == n || j == 1 || j == n
                uFut(i,j) = 0;
            else
                uFut(i,j) = (2-4*lam)*uCur(i,j) + lam*(uCur(i-1,j) + uCur(i+1,j) + uCur(i,j-1) + uCur(i,j+1)) - uPast(i,j);
            end
        end
    end
    
    mesh(x,y,uCur),xlabel('X axis'), ylabel('Y axis');
    drawnow

    uPast = uCur;
    uCur = uFut;
    disp(uCur(2,2));
end