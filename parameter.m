viewview = [90 -90];

Nx = 100;
R = 1; 
dx = 2*R/Nx;
x = -R:dx:R;
[X, Y] = meshgrid(x);

T = .2;
Nt = 60;
dt = T/Nt;
t = 0:dt:T;


f = ones(Nx+1,Nx+1, Nt+1);
dtf = zeros(Nx+1,Nx+1, Nt+1);
c = zeros(Nx+1,Nx+1);

for ix = 1:Nx+1
    for iy = 1:Nx+1
        c(ix,iy) = 0.2*(x(ix)^2 + x(iy)^2);
        for it = 1:Nt+1
            f(ix,iy,it) = 1 + 0.2*exp(t(it)*(x(ix)^2 + x(iy)^2));
            dtf(ix,iy,it) = 0.2*(x(ix)^2 + x(iy)^2)*exp(t(it)*(x(ix)^2 + x(iy)^2));
        end
    end
end

