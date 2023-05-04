function rotatedFilter = rotate180(filter)
% this function rotate 180 degree a filter and output it
% inputs: filter: a 3*3 filter that must rotate
% outputs: there is no output
    filterTemp = filter;
    filter(1,1) = filterTemp(3,3);
    filter(1,2) = filterTemp(3,2);
    filter(1,3) = filterTemp(3,1);
    filter(2,1) = filterTemp(2,3);
    filter(2,2) = filterTemp(2,2);
    filter(2,3) = filterTemp(2,1);
    filter(3,1) = filterTemp(1,3);
    filter(3,2) = filterTemp(1,2);
    filter(3,3) = filterTemp(1,1);
    
    rotatedFilter = filter;
end

