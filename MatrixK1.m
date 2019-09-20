
resetMatrix
for k= 1:Nt+1
    for i = [1,Nx+1]
        for j= 1:Nx+1
            n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            iloc(ind) = n;
            jloc(ind) = n;
            vals(ind) = 1;
            ind = ind+1;
            
        end 
    end  
end

for k = 1:Nt+1  
   for i = 2:Nx
        for j= [1,Nx+1]
            n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
            iloc(ind) = n;
            jloc(ind) = n;
            vals(ind) = 1;
            ind = ind+1;
            
        end 
    end  
end

K1 = sparse(iloc,jloc,vals,N,N);
