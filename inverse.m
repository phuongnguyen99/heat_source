
epsilon = 10^(-8);


MatrixD
MatrixK1
MatrixK2
regularization;
LHS = [D; K1; K2];
RHS1 = [zeros(N,1); zeros(N,1); RHS];

tic
vLineUp = (LHS' * LHS + epsilon*(speye(N,N) + Dx'*Dx + Dy'*Dy))\ (LHS'*RHS1);
p_compt = zeros(Nx+1, Nx+1);
toc
k=1;
for i= 1:Nx+1
    for j= 1:Nx+1
         n =(i-1)*(Nx+1)*(Nt+1)+(j-1)*(Nt+1)+k;
         p_compt(i,j) = vLineUp(n) / f(i,j,1);
    end
    
end

fig = figure;
surf(X,Y,p_compt,'EdgeColor','none');
view([90 -90]);
set(gca, 'FontSize',20);
colorbar;
st = sprintf('Pic/p_comptModel%dNoise%d',caseid,noise);
saveas(fig,st,'jpg');
