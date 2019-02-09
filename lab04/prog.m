alpha1 = [4 1 10 25.5 120];
alpha2 = [12 12 1 320 35.12];
X = (alpha1 - 1)./(alpha1 + alpha2 - 2);
c = density(X, alpha1, alpha2);
length = 100000;
U = zeros(size(alpha1, 2), length);
for i = 1:size(c, 2)
    U(i, :) = generate(alpha1(1, i), alpha2(1, i), length, c(1, i));
end

for i = 1:size(alpha1, 2)
    figure(i);
    hist(U(i, :), 100);
    title(['{\alpha_1} = ', num2str(alpha1(1,i)), '{\alpha_2} = ', num2str(alpha2(1,i))]);
end

function[u] = generate(alpha, beta, n, c)
    u = zeros(1, n);
    for i = 1:n
        accept = false;
        while accept == false
            u1 = rand();
            u2 = rand();
            if u1*c <= density(u2, alpha, beta)
                u(1, i) = u2;
                accept = true;
            end
        end
    end
end

function[y] = density(x, alpha, Beta)
    y = ((x.^(alpha - 1)).*((1-x).^(Beta-1)))./ beta(alpha, Beta);
end