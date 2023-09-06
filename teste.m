% Entrada
xi = [-0.7293 0.0221 0.2210 0.7477 -0.3094];
yi = [-0.5397 -0.3014 0.2453 0.6332 -0.2874];


graus = [1, 2, 3];
n = length(xi);
Q = zeros(length(graus), 1);

for k = 1:length(graus)
    grau = graus(k);

    % Cálculo dos coeficientes
    A = zeros(n, grau + 1);
    for i = 1:n
        for j = 1:(grau + 1)
            A(i, j) = xi(i)^(grau + 1 - j);
        end
    end
    coeficientes = (A' * A) \ (A' * yi');

    % Aproximações
    aproximacoes = A * coeficientes;

    % Erro de truncamento
    disp(aproximacoes);
    disp( sum((yi - aproximacoes').^2));
    erro = sum((yi - aproximacoes).^2);


    % Saída
    %fprintf('Polinômio de grau %d\n', grau);
    %fprintf('-> Coeficientes: %.4f ', coeficientes);
    %fprintf('\n-> Aproximações: %.4f ', aproximacoes);
    %fprintf('\n-> Erro de truncamento: %.4f\n\n', erro);
end
