function plots = a()
% this function do home work's part "a"
% first we input piece wise functions from user
% and after that plot them with together
% inputs: there is no input
% outputs: plots: a struct that store all functions
    plots.input1 = makeInputFunction();
    plots.input2 = makeInputFunction();
    plots.input3 = makeInputFunction();
    plots.output1 = makeOutputFunction();
    plots.output2 = makeOutputFunction();
    plots.output3 = makeOutputFunction();
    
    figure;
    
    subplot(1,2,1);
    plot(plots.input1.p.XData(1,:) , plots.input1.p.YData(1,:) );
    hold on;
    plot(plots.input2.p.XData(1,:) , plots.input2.p.YData(1,:) );
    plot(plots.input3.p.XData(1,:) , plots.input3.p.YData(1,:) );
    hold off;
    title('input fuzzy function');
    axis([0 255 0 1]);
    
    subplot(1,2,2);
    plot(plots.output1.p.XData(1,:) , plots.output1.p.YData(1,:) );
    hold on;
    plot(plots.output2.p.XData(1,:) , plots.output2.p.YData(1,:) );
    plot(plots.output3.p.XData(1,:) , plots.output3.p.YData(1,:) );
    hold off;
    title('output fuzzy function');
    axis([0 255 0 1.5]);
end

