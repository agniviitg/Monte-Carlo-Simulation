m = 18;a=7; c = 7;seed = 1;

x = zeros(17, 1);
x(1) = seed;
for i = 1:16
    x(i+1,1) = mod(a*x(i,1) + c, m);
end

u = x/m;


figure(1);

U = fibonacii(u, 1000);

V = U(1:999, 1);
W = U(2:1000, 1);
subplot(2,3,1);
plot(V, W, 'x');
title("No of values = 1000");
subplot(2, 3, 4);
hist(U);

U = fibonacii(u, 10000);

V = U(1:9999, 1);
W = U(2:10000, 1);
subplot(2,3,2);
plot(V, W, 'x');
title("No of values = 10000");
subplot(2, 3, 5);
hist(U);


U = fibonacii(u, 100000);
V = U(1:99999, 1);
W = U(2:100000, 1);
subplot(2, 3, 3);
plot(V, W, 'x');
title("No of values = 100000");
subplot(2, 3, 6);
hist(U);

function [U] = fibonacii(u, m)

U = zeros(m, 1);
U(1:17, 1) = u;

for i = 18:m
    U(i, 1) = U(i-17, 1) - U(i-15, 1);
    if U(i, 1) < 0
        U(i, 1) = 1 + U(i, 1);
    end
end

end

