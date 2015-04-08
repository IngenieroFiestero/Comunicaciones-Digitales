function e = generar_errores(N,p)
e=rand(1,N);
e(e>1-p)=1;
e(e<=1-p)=0;
end