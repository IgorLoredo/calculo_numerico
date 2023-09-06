function [coeficientes, aproximacoes, erro] = aproximarPolinomio(xi, yi, grau)
    n = length(xi);
    A = zeros(n, grau + 1);
    for i = 1:n
        for j = 1:(grau + 1)
            A(i, j) = xi(i)^(grau + 1 - j);
        end
    end

    coeficientes = (A' * A) \ (A' * yi');
    aproximacoes = A * coeficientes;
    erro = sum((yi - aproximacoes').^2);
end

% Entrada
xi = input('');
yi = input('');

% Aproximações para polinômios de graus 1, 2 e 3
graus = [1, 2, 3];
for k = 1:length(graus)
    grau = graus(k);
    [coeficientes, aproximacoes, erro] = aproximarPolinomio(xi, yi, grau);

    % Saída
    disp(['Polinômio de grau ' num2str(grau)]);
    disp(['-> Coeficientes: ' num2str(coeficientes', '%.4f ')]);
    disp(['-> Aproximações: ' num2str(aproximacoes', '%.4f ')]);
    disp(['-> Erro de truncamento: ' num2str(erro, '%.4f')]);
    disp('');
end
