function p = create2function()     % this function call makeFunction twice
                                   % to draw transform functions
                                   % input: there is no input
                                   % output: p : a structure that store
                                   % 2 plots that drawed
    p.plot1 = makeFunction();
    p.plot2 = makeFunction();
end