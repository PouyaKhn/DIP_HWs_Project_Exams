function functionPlot = makeFunction()    % this function is a GUI interface
                                          % that allowed user to select
                                          % some points and using this
                                          % points to draw a plot
                                          % input: there is no input
                                          % output: functionPlot : this is
                                          % plot that user drawed
    figure;
    title('Right click on points and after that press ENTER plz ');
    axis([0 255 0 65000]);
    xlabel('grey level');
    ylabel('frequency');
    coords = ginput;
    close;
    functionPlot.f = figure;
    functionPlot.p = plot(coords(:,1),coords(:,2));
    functionPlot.t = title(' Here is your histogram overall shape :D ');
    xlabel('grey level');
    ylabel('frequency');
    axis([0 255 0 65000]);
end