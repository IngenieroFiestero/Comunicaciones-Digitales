function m = mi_decodificar_bloque_hamming74(r,n,k)
H=[1 0 1;1 1 0; 1 1 1;0 1 1;1 0 0;0 1 0;0 0 1]';
errores=[0 0 0 0 0 0 0;
        0 0 0 0 0 0 1;
        0 0 0 0 0 1 0;
        0 0 0 1 0 0 0;
        0 0 0 0 1 0 0;
        0 1 0 0 0 0 0;      
        1 0 0 0 0 0 0;  
        0 0 1 0 0 0 0];
S=mod(r*H',2);
if sum(S)==0
    m=r(1:4);
else
    m=mod(r+errores(S(3)+2*S(2)+4*S(1)+1,:),2);
    m=m(1:4);
end
end