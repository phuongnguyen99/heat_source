
p_true = zeros(Nx + 1, Nx + 1);
if (caseid == 1)
    x0 = .3; y0 = 0; r0= 0.5;
    for ix = 1:Nx +1
        for iy = 1:Nx + 1
            r = (x(ix)- x0)^2 + (x(iy)-y0)^2;
            if (r < r0^2)
                p_true(ix, iy) = exp(r/(r - r0^2));
            end
        end
    end
end


if (caseid == 2)
    x0 = .4; y0 = 0.4; r0= 0.5;
    for ix = 1:Nx +1
        for iy = 1:Nx + 1
            r = (x(ix)- x0)^2 + (x(iy)-y0)^2;
            if (r < r0^2)
                p_true(ix, iy) = exp(r/(r - r0^2));
            end
        end
    end
    x0 = -.4; y0 = -0.4; r0= 0.5;
    for ix = 1:Nx +1
        for iy = 1:Nx + 1
            r = (x(ix)- x0)^2 + (x(iy)-y0)^2;
            if (r < r0^2)
                p_true(ix, iy) = -2*exp(r/(r - r0^2));
            end
        end
    end
end


if (caseid == 3)
    x0 = .45; y0 = 0; r0= 0.25;
    for ix = 1:Nx +1
        for iy = 1:Nx + 1
            r = (x(ix)- x0)^2 + (x(iy)-y0)^2;
            if (r < r0^2)
                p_true(ix, iy) = -2;
            end
        end
    end
    x0 = -.45; y0 = 0.; r0= 0.25;
    for ix = 1:Nx +1
        for iy = 1:Nx + 1
            r = 5*(x(ix)- x0)^2 + 1/3*(x(iy)-y0)^2;;
            if (r < r0)
                p_true(ix, iy) = 2;
            end
        end
    end
end

if (caseid == 4)    
    I = imread('Letter/Omega.png');
    I = im2double(I);    
    p_true1= 1-imresize(I,[Nx+1 Nx+1]);
    p_true(:,:) = p_true1(:,:,1).^2 + p_true1(:,:,2).^2 + p_true1(:,:,3).^2;
    I = find(p_true > 0.2);  
    p_true(I) = 1;
    p_true = smooth2a(p_true,2,2);
    I = find(p_true > 0.1);  
    p_true(I) = 1;
end

if(caseid == 5)
    p_true = phantom(Nx+1);
end

fig = figure;
surf(X,Y,p_true,'EdgeColor','none');
view([90 -90]);
set(gca, 'FontSize',20);
colorbar;
st = sprintf('Pic/q_trueModel%d',caseid);
% saveas(fig,st,'jpg');
