data = zeros(size(u_true));

i = 1;
for k = 1:Nt+1
    for j = 1:Nx+1
        data(i,j,k) = (u_true(i, j, k) - u_true(i + 1, j, k))/dx;
    end
end

i = Nx+1;
for k = 1:Nt+1
    for j = 1:Nx+1
        data(i,j,k) = (u_true(i, j, k) - u_true(i-1,j, k)) /dx;
    end
    
end



j = 1;
for k = 1:Nt+1
    for i = 2:Nx
        data(i,j,k) =(u_true(i,j,k) -u_true(i,j+1,k)) /dx;
    end
    
end

j = Nx+1;
for k = 1:Nt+1
    for i = 2:Nx
        data(i,j,k) = (u_true(i,j,k) - u_true(i,j-1,k))/ dx;
    end
    
end

% figure;
% plot(squeeze(data(20,1,:)));

dtdata = zeros(size(data));
dtdata(:,:,1:Nt) = (data(:,:,2:Nt+1) - data(:,:,1:Nt))/dt;
dtdata(:,:,Nt+1) = 2*dtdata(:,:,Nt) - dtdata(:,:,Nt-1);

dtdataNoise = dtdata.*(1 + noise/100*(-1 + 2*rand(size(dtdata))));
