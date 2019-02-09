a = 6; b = 0; m = 11;
x1 = zeros(11, 11);
x2 = x1;

for i = 0:10
    x1(i+1, 1) = i;
    for j = 1:10
        x1(i+1, j+1) = mod(a*x1(i+1, j)+b, m);
    end
end

a = 3;

for i = 0:10
    x2(i+1, 1) = i;
    for j = 1:10
        x2(i+1, j+1) = mod(a*x2(i+1, j)+b, m);
    end
end
%print the sequences with first entry of each row denoting the seed for
%that sequence

x1

x2

%plotting no of times each value in the sequence repeated tabularly
close all;

figure(1);
for i = 0:10
    subplot(2, 6, i+1);
    hist(x1(i+1, :));
    title(['x_0=', num2str(i)]);
end
suptitle('a=6');
figure(2);
for i = 0:10
    subplot(2, 6, i+1);
    hist(x2(i+1, :));
    title(['x_0=', num2str(i)]);
end
suptitle('a=3');