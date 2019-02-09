c1 = f_by_g(fminbnd(@(x) -f_by_g(x), 0, 1));
c2 = ceil(c1);
c3 = c2+1;
[x1,iter1] = seq(c1);
avg1 = sum(x1)/size(x1,2);
[x2,iter2] = seq(c2);
avg2 = sum(x2)/size(x2,2);
[x3,iter3] = seq(c3);
avg3 = sum(x3)/size(x3,2);
close all;
figure(1);
hist(x1, 500);
title(["c = ", c1, "average = ", avg1]);
figure(2);
hist(x2, 500);
title(["c = ", c2, "average = ", avg2]);
figure(3);
hist(x3, 500);
title(["c = ", c3, "average = ", avg3]);
figure(4);
X = 0:0.01:1;
Y = f(X);
plot(X, Y);
title("Plot of actual density function");

function[x, iter] = seq(c)
    x = zeros(1, 1000000);
    iter = zeros(size(x));
    for i = 1:1000000
        accept = false;
        while accept == false
            u = rand(1,1);
            x(1,i) = rand(1,1);
            iter(1,i) = iter(1,i) + 1;
            if u <=(f_by_g(x(1,i))/c)
                accept = true;
            end
        end
    end
end
function[h] = f_by_g(x)
h = f(x);
end

function[val] = f(x)
val = 20*(x.*((1-x).^3));
end