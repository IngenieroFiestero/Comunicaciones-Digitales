function [ u ] = mi_codificar_bloque_hamming74( m,n,k )
u=[m,mod(m(1)+m(2)+m(3),2),mod(m(2)+m(3)+m(4),2),mod(m(1)+m(3)+m(4),2)];
end

