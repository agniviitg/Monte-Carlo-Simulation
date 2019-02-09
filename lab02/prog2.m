theta = 1;
u = create_the_lcg(10000, 51, 13);
X = -(theta*log(1-u));
figure(1);
subplot(2,3,1);
plot_freq_vs_midpoint(100, 10000, X);
[mean, variance] = mean_var(X);
title(["No of observations = 10000 mean = ", mean, "variance = ",variance ]);
subplot(2,3,4);
plot_cumfreq_vs_mid(100, 1000, X);
title("Distribution");
figure(2);
subplot(1, 3, 1);
plot_the_distribution(100, theta);
title(["Actual distribution function mean=1 variance=1"]);
u = create_the_lcg(100000, 51, 13);
X = -(theta*log(1-u));
figure(1);
subplot(2,3,2);
plot_freq_vs_midpoint(100, 100000, X);
[mean, variance] = mean_var(X);
title(["No of observations = 100000 mean = ", mean, "variance = ",variance ]);
subplot(2,3,5);
plot_cumfreq_vs_mid(100, 100000, X);
title("Distribution");
figure(2);
subplot(1,3,2);
plot_the_distribution(100, theta);
title(["Actual distribution function mean=1 variance=1"]);
u = create_the_lcg(1000000, 51, 13);
X = -(theta*log(1-u));
figure(1);
subplot(2,3,3);
plot_freq_vs_midpoint(100, 1000000, X);
[mean, variance] = mean_var(X);
title(["No of observations = 1000000 mean = ", mean, "variance = ",variance ]);
subplot(2,3,6);
plot_cumfreq_vs_mid(100, 1000000, X);
title("Distribution");
figure(2);
subplot(1, 3, 3);
plot_the_distribution(100, theta);
title(["Actual distribution function mean=1 variance=1"]);
suptitle("No of observations being 10^4, 10^5 and 10^6 respectively");


function[] = plot_cumfreq_vs_mid(n, m, x)
    d = 7/n ;
    lbd = 0:d:7;
    lbd = lbd(1, 1:(size(lbd, 2) - 1))';
    ubd = lbd + d;
    mid = (lbd + ubd)/2;
    hi = hist(x, n);
    dist = zeros(size(hi));
    for i = 1:size(hi, 2)
        for j = 1:i
            dist(i) = dist(i) + hi(j);
        end
    end
    dist = dist/m;
    plot(mid, dist);
end

function[] = plot_freq_vs_midpoint(n, ~, x)
    d = 7/n ;
    lbd = 0:d:7;
    lbd = lbd(1, 1:(size(lbd, 2) - 1))';
    ubd = lbd + d;
    mid = (lbd + ubd)/2;
    hi = hist(x, n);
    plot(mid, hi);
end

function[] = plot_the_distribution(n, theta)
    d = 7/n;
    lbd = 0:d:7;
    lbd = lbd(1, 1:(size(lbd, 2) - 1))';
    ubd = lbd + d;
    mid = (lbd + ubd)/2;
    Fvalue = 1-exp(-mid/theta);
    plot(mid, Fvalue);
end

function[u] = create_the_lcg(m, a, c)
    x = zeros(m, 1);
    x(1,1) = 1;
    for i = 1:m-1
        x(i+1, 1) = mod(a*x(i, 1) + c, m);
    end
    u = x/m;
end

function[avg , var] = mean_var(x)
    n = size(x, 1);
    avg = sum(x)/n;
    var = (sum(x.^2)/n)-avg^2 ;
end