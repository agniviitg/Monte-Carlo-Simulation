c = 1:2:9999;
m = size(c,2);
v = m*rand(1,10000000);
v = ceil(v);
seq = zeros(1,10000000);

for i = 1:size(seq, 2)
    seq(1,i) = c(1,v(1,i));
end
close all;
hist(seq, 5000)
