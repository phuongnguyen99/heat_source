resetMatrix
RHS = zeros(N,1);

for k = 1:Nt+1
    for i = 1:1
        for j =1:Nx+1
            n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            n1 =(i-1+1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            iloc(ind:ind+1) =[n,n];
            jloc(ind:ind+1) =[n,n1];
            vals(ind:ind+1) =[1/dx, -1/dx];
            ind = ind+2;
            RHS(n) = dtdataNoise(i,j,k);
        end
        
    end
    
end


for k = 1:Nt+1
    for i = Nx+1:Nx+1
        for j =1:Nx+1
            n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            n1 =(i-1-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            iloc(ind:ind+1) =[n,n];
            jloc(ind:ind+1) =[n,n1];
            vals(ind:ind+1) =[1/dx, -1/dx];
            ind = ind+2;
            RHS(n) = dtdataNoise(i,j,k);
        end
        
    end
    
end


for k = 1:Nt+1
    for i = 2:Nx
        for j =1:1
            n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            n1 =(i-1)*(Nx+1)*(Nt+1)+(j-1+1)*(Nt+1)+k;
            iloc(ind:ind+1) =[n,n];
            jloc(ind:ind+1) =[n,n1];
            vals(ind:ind+1) =[1/dx, -1/dx];
            ind = ind+2;
            RHS(n) = dtdataNoise(i,j,k);
        end
        
    end
    
end

for k = 1:Nt+1
    for i = 2:Nx
        for j =Nx+1:Nx+1
            n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            n1 =(i-1)*(Nx+1)*(Nt+1)+(j-1-1)*(Nt+1)+k;
            iloc(ind:ind+1) =[n,n];
            jloc(ind:ind+1) =[n,n1];
            vals(ind:ind+1) =[1/dx, -1/dx];
            ind = ind+2;
            RHS(n) = dtdataNoise(i,j,k);
        end
        
    end
    
end

K2 = sparse(iloc,jloc,vals,N,N);
