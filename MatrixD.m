N = (Nx+1)^2*(Nt+1);


resetMatrix
for k = 2:Nt+1
    for i = 2:Nx
       for j = 2:Nx
           n = (i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
           n1= (i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k-1;
           n2= (i-1-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
           n3= (i-1+1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
           n4= (i-1)*(Nx+1)*(Nt+1)+(j-1+1)*(Nt+1)+k;
           n5= (i-1)*(Nx+1)*(Nt+1)+(j-1-1)*(Nt+1)+k;
           n6= (i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+1;
           iloc(ind:ind+6)= [n,n,n,n,n,n,n];
           jloc(ind:ind+6)= [n,n1,n2,n3,n4,n5,n6];
           vals(ind:ind+6)= [4/dx^2+1/dt - c(i,j), -1/dt, -1/dx^2, -1/dx^2, ...
               -1/dx^2, -1/dx^2, -dtf(i,j,k)/f(i,j,1)];
          ind= ind+7;        
       end
    end
    
end
D = sparse(iloc,jloc,vals,N,N);
