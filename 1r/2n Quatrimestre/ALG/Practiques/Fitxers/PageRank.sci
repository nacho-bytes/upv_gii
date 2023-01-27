//Estos programas han sido diseñados para ser usados en la asignatura de Álgebra 
//Su finalidad es exclusivamente didáctica.



function A=randomat(n)
  g=grand(n,n,'def');
  A=ones(n,n);
  c=ones(n,1);
  for j=1:n,
    x=0;
    for i=1:n,
      if i==j then A(i,i)=0; 
      else
        if i==3 then A(i,j)=1; x=x+1;
          else
             if g(i,j)<=4/5 then A(i,j)=0; 
               else
                 A(i,j)=1; x=x+1;
               end;
          end;
       end;
   end;
   c(j)=x;
 end;
 for i=2:n,
   A(i,1)=0;
 end;
 A(3,1)=1
 c(1)=1;
 for j=1:n,
   for i=1:n,
     if c(j)<>0 then A(i,j)=A(i,j)/c(j); end;
   end;
 end;
endfunction
