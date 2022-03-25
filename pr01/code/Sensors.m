function obs = Sensors
    n = randi(10);
    fprintf('Locating %d attractors/repulsors.\n',n)
    str = randi([-10,10],n,1);
    xi = randi(2000,n,1);
    yi = randi(1000,n,1);
    obs = [str,xi,yi;zeros(10-n,3)];
end