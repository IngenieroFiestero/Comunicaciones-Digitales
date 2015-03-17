function d = shannon-fano(m)
if exist('m','var')
    %dimension de la matriz de 2
        if length(m) == 2
            d ={};
            d{1} = 0;
            d{2} = 1;
        elseif length(m) == 1
            d = {};
        %Valores mayores a dos
        else
            d={};
            %calcular la suma total de la matriz
            suma = sum(m);
            %Ordenar matriz entrada
            m=sort(m,'descend');
            aux=zeros(1,length(m-1));
            for i=1:length(m-1)
                aux(i)=abs(suma/2-sum(m(1:i)));
            end
            minimo=find(aux==min(aux));
            %Añadir los datos a lo que se devuelve
            for i=1:length(m)
                if i <= minimo
                    d{i} = [0];
                else
                    d{i} = [1];
                end
            end
            %Hacer las rellamadas
            m1 = m(1:minimo);
            m2 = m(minimo+1:length(m));
            if length(m1) == 1
                d2 = dividirMatriz(m2);
                for i=1:length(m) - 1
                    d{i + 1} = [d{i + 1} d2{i}];
                end
            else
                d1 = dividirMatriz(m1);
                d2 = dividirMatriz(m2);
                for i=1:length(m)
                    if i <= minimo
                        d{i} = [d{i} d1{i}];
                    else
                        d{i} = [d{i} d2{i - minimo}];
                    end
                end
            end
        end
else
    fprintf('No existe variable de entrada');
end
end