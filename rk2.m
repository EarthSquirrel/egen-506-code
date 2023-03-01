r=2;
k=2000;
p0=2;
f = @(t,y) r*y*(1-y/k);

time=10;
n=107;
h=time/n;
p=zeros(n+1, 1);
p(1)=p0;

for i = 2:n +1
    k1 = f([],p(i-1));
    k2 = f([], p(i-1) + (3/4)*k1*h);
    p(i) = p(i-1) + (k1/3 + 2*k2/3)*h;
end
plot(0:h:time, p);
hold  on

% [tau, y] = ode4f(f, ...)
[t, y] = ode45(f,[0, time], p0);

plot(t, y, 'r');