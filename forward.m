parameter;
Model;
u_true = zeros(Nx+1,Nx+1,Nt+1);
N =(Nx+1)^2;

for k =2:Nt+1
    resetMatrix;
    rhs = zeros(N,1);
    for i= 2:Nx
      for j= 2:Nx
          n = (i-1)*(Nx+1)+j;
          n1 =(i-1-1)*(Nx+1)+j;
          n2 = (i-1+1)*(Nx+1)+j;
          n3 =(i-1)*(Nx+1)+j-1;
          n4 =(i-1)*(Nx+1)+j+1;
          iloc(ind:ind+4) =[n,n,n,n,n];
          jloc(ind:ind+4) =[n,n1,n2,n3,n4];
          vals(ind:ind+4) =[-4*dt/dx^2 - 1 + dt*c(i,j),dt/dx^2, dt/dx^2, dt/dx^2, dt/dx^2];
          ind=ind+5;
          rhs(n)= -u_true(i,j,k-1)- dt*p_true(i,j)*f(i,j);
      end  
    end 
    D = sparse(iloc,jloc,vals,N,N);
    resetMatrix;
    for i = [1,Nx+1]
        for j = 1:Nx+1
            n = (i-1)*(Nx+1)+j;
            iloc(ind) = n;
            jloc(ind) = n;
            vals(ind) = 1;
            ind = ind+1;
        end
    end
    for i= 2:Nx
        for j = [1,Nx+1]
             n = (i-1)*(Nx+1)+j;
            iloc(ind) = n;
            jloc(ind) = n;
            vals(ind) = 1;
            ind = ind+1;
        end
        
    end
    K =sparse(iloc,jloc,vals,N,N);
    
    LHS = [ D;K];
    RHS = [rhs; zeros(N,1)];
    uLineup = (LHS' * LHS )\( LHS'* RHS);
    for i = 1:Nx+1
        for j = 1:Nx+1
            n = (i-1)*(Nx+1)+j;
            u_true(i,j,k)=uLineup(n);
        end
    end
end



