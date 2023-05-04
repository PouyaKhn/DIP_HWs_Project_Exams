function functionPlot = makeFunction()    % this function is a GUI interface
                                          % that allowed user to select
                                          % some points and using this
                                          % points to draw a transform
                                          % function
                                          % input: there is no input
                                          % output: functionPlot : this is
                                          % plot that user drawed
    figure;
    title('Right click on points and after that press ENTER plz ');
    axis([0 255 0 255]);
    xlabel('Input Intensity level, r');
    ylabel('Output Intensity level, s');
    coords = ginput;         % record points that user selected
    height = size(coords,1);
    coords2 = zeros(height+2,2);
    coords2(height+2,1) = 255;
    coords2(height+2,2) = 255;
    for i=2:(height+1)       % set first and last points 0 and 255
        coords2(i,1) = coords(i-1,1);
        coords2(i,2) = coords(i-1,2);
    end
    close;
    functionPlot.f = figure;
    functionPlot.p = plot(coords2(:,1),coords2(:,2));  % draw plot between points
    functionPlot.t = title(' Here is your function :D ');
    xlabel('Input Intensity level, r');
    ylabel('Output Intensity level, s');
    axis([0 255 0 255]);
end