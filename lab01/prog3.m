a = 1229;
b = 1;
m = 2048;

%let the seed be 1
x = zeros(1, m);
x(1,1) = 1;
u = x/m;

for i = 1:(m-1)
    x(i+1) = mod(a*x(i)+b, m);
    u(i+1) = x(i+1)/m;
end

close all;
v = u(2:m);
u = u(1:(m-1));
plot(u, v, 'o');
