function functionPlot = makeInputFunction()    % this function is a GUI interface
                                          % that allowed user to select
                                          % some points and using this
                                          % points to draw a transform
                                          % function
                                          % input: there is no input
                                          % output: functionPlot : this is
                                          % plot that user drawed
%     coords = zeros(3,2);
%     for i=1:3
%         for j=1:2
%             coords(i,j)=uint8(input(strcat('please enter (',int2str(i),',',int2str(j),'): ' )));
%         end
%     end
    figure;
    title('Right click on points and after that press ENTER plz ');
    axis([0 255 0 1.5]);
    xticks(0:5:255);
    xlabel('z');
    ylabel('degree of membership');
    coords = ginput;
    close;
    coords = round(coords);
    functionPlot.f = figure;
    functionPlot.p = plot(coords(:,1),coords(:,2));  % draw plot between points
    axis([0 255 0 1.5]);
    xlabel('z');
    ylabel('degree of membership');
end