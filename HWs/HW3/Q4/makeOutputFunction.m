function functionPlot = makeOutputFunction()  % this function is a GUI interface
                                          % that allowed user to select
                                          % some points and using this
                                          % points to draw a transform
                                          % function
                                          % input: there is no input
                                          % output: functionPlot : this is
                                          % plot that user drawed

%     coords2 = zeros(2,2);
%     coords2(1,1) = uint8(input('Please enter output value: '));
%     coords2(1,2) = 1;
%     coords2(2,1) = coords2(1,1);
    figure;
    title('Right click on point and after that press ENTER plz ');
    axis([0 255 0 1.5]);
    xticks(0:5:255);
    xlabel('v');
    ylabel('degree of membership');
    coords = ginput;
    close;
    coords = round(coords);
    coords2 = zeros( size(coords,1)+1 , 2);
    coords2(1,1) = coords(1,1);
    coords2(1,2) = coords(1,2);
    coords2(2,1) = coords(1,1);
    functionPlot.f = figure;
    functionPlot.p = plot(coords2(:,1),coords2(:,2));  % draw plot between points
    axis([0 255 0 1.5]);
    xlabel('z');
    ylabel('membership');

end

