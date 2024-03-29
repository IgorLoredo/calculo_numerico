


function [invA, L, U, P, P1, P2, M1, M2] = gauss_elimination(A)
% Eliminação de Gauss com pivotação parcial
%        L - matriz triangular inferior
%        U - matriz triangular superior
%        P - matriz de permutação

    inv_A = inv(A);
    n = size(A,1);

    % Criando matrizes multidimensionais para salvar dados

    Pk = zeros(n,n,n-1);
    Mk = zeros(n,n,n-1);

    P = eye(n); L = P; U = A;
    for k=1:n
        [~,p] = max(abs(U(k:n,k)));
        p = p+(k-1);
        P([k p],:) = P([p k],:);
        U([k p],k:n) = U([p k],k:n);
        L([k p],1:k-1) = L([p k],1:k-1);

         Mk(:,:,k) = eye(n);
        Mk(:,:,k) = L;

        for i=k+1:n
            L(i,k) = U(i,k)/U(k,k);
            U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
        end
        Pk(:,:,k) = P;

    end

disp("inv(A) =");
disp(inv_A);
disp("L = ");
disp(L);
disp("U = ");
disp(U);
disp("P = ");
disp(P);
for k = 1:n-1
    fprintf("P%d =\n", k);
    disp(Pk(:,:,k));
end
for k = 1:n-1
    fprintf("M%d =\n", k);
    disp(Mk(:,:,k));
end

end

