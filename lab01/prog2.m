m = 244944;
seed = [7; 10; 225; 1457; 11486];
a = 1597;
x1 = zeros(5,m);
x1(:, 1) = seed;
u1 = x1/m;
for i = 1:5
    for j = 1:244943
        x1(i, j+1) = mod(a*x1(i, j), m);
        u1(i, j+1) = x1(i, j+1)/m;
    end
end

a = 51749;
x2 = zeros(5,m);
x2(:, 1) = seed;
u2 = x2/m;
for i = 1:5
    for j = 1:244943
        x2(i, j+1) = mod(a*x2(i, j), m);
        u2(i, j+1) = x2(i, j+1)/m;
    end
end

lbd = 0:0.05:1 ;
ubd = lbd + 0.05;

freq1 = zeros(5, size(lbd, 2)-1);
freq2 = zeros(5, size(lbd, 2)-1);

for i = 1:5
    for j = 1:m
        for k = 1:(size(lbd, 2)-1)
            if u1(i, j) >= lbd(k) && u1(i, j) < ubd(k)
                freq1(i, k) = freq1(i, k) + 1;
            end
            if u2(i, j) >= lbd(k) && u2(i, j) < ubd(k)
                freq2(i, k) = freq2(i, k) + 1;
            end
        end
    end
end

freq1
freq2
close all;
figure(1);
for i = 1:5
    subplot(2,3,i);
    nbins=20;
    hist(u1(i, :), nbins);
    title(['x_0 = ', num2str(seed(i))]);
end
suptitle('a = 1597');

figure(2);
for i = 1:5
    subplot(2,3,i);
    nbins=20;
    hist(u2(i, :), nbins);
    title(['x_0 = ', num2str(seed(i))]);
end
suptitle('a = 51749');


