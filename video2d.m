function video2d(u)
    st = strcat('out2d.avi');
    writerObj = VideoWriter(st); % Name it.
    writerObj.FrameRate = 6; % How many frames per second.
    open(writerObj); 
    figure;
    hold off
    Nt = size(u,3);
    co = max(max(max(abs(u))));
    for i=1:Nt    
    % We just use pause but pretend you have some really complicated thing here...
    pause(0.001);
     % Makes sure you use your desired frame.
    surf(u(:,:,i),'EdgeColor','none');
    view([90 -90]);
%     caxis([0 1])
%    zlim(co*[-1 1]);
    colorbar;
    %if mod(i,4)==0, % Uncomment to take 1 out of every 4 frames.
        frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
        writeVideo(writerObj, frame);
    %end
 
    end
    hold off
    close(writerObj);
end


 