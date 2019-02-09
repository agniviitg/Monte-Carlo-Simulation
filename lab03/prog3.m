num = 1:1:10;
prob = [0.11, 0.12, 0.09, 0.08, 0.12, 0.10, 0.09, 0.09, 0.10, 0.10];
c1 = max(10*prob);
close all;
figure(1);
u1 = seq(c1);
hist(u1, 10);
title(['c = ', num2str(c1)]);
figure(2);
c2 = ceil(c1);
u2 = seq(c2);
hist(u2, 10);
title(['c = ', num2str(c2)]);
figure(3);
c3 = ceil(c1)+1;
u3 = seq(c3);
hist(u3, 10);
title(['c = ', num2str(c3)]);

function[u] = seq(c)
    u = zeros(1,1000000);
    prob = [0.11, 0.12, 0.09, 0.08, 0.12, 0.10, 0.09, 0.09, 0.10, 0.10];
    for i = 1:1000000
        accept = false;
        while accept == false
            x = rand();
            v = grand();
            if x <= (prob(v)/(c*0.1))
                u(1,i) = v;
                accept = true;
            end
        end
    end
end


function[x] = grand()
    u = 10*rand();
    x = ceil(u);
end