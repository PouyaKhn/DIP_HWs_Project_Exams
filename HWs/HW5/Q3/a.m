function x = a(img)
% this function perform part 'a' of question 3
% this function change coordinates of image to cartesian coordinate
% input: img: original hand make image
% output: x: changed coordinate image based on hand make image
[x1,x2] = find(img == 0);
changedX1 = size(img,1) - x1 ;
x = [x2 , changedX1] ;
end

