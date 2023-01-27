function x=DD(A)
    //Determina, para la matriz cuadrada A y por filas, la diferencia (en valor absoluto) entre el elemento diagonal y el resto de elementos.
    [n,n]=size(A);
    v=zeros(n);
    for i=1:n 
        v(i)=2*abs(A(i,i))-sum(abs(A(i,:)));
    end;
    x=and(v>0)
endfunction
