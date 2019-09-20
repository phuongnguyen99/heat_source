resetMatrix
for k = 1:Nt+1
    for i = 2:Nx+1
       for j = 1:Nx+1
           n = (i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
           n1= (i-1-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
           
           iloc(ind:ind+1)= [n,n];
           jloc(ind:ind+1)= [n,n1];
           vals(ind:ind+1)= [1/dx,-1/dx];
           ind = ind+1;    
       end
    end
    
end
Dx = sparse(iloc,jloc,vals,N,N);

resetMatrix
for k = 1:Nt+1
    for i = 1:Nx+1
       for j = 2:Nx+1
           n = (i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
           n1= (i-1)*(Nx+1)*(Nt+1)+(j-1-1)*(Nt+1)+k;
           
           iloc(ind:ind+1)= [n,n];
           jloc(ind:ind+1)= [n,n1];
           vals(ind:ind+1)= [1/dx,-1/dx];
           ind = ind+1;       
       end
    end
    
end
Dy = sparse(iloc,jloc,vals,N,N);