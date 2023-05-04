original = imread('home.jpg');
original = rgb2gray(original);

parameter = input('Enter shearing parameter: ');
t = [1, parameter, 0; 0, 1, 0; 0, 0, 1];
T = maketform('affine',t);
input = uint8(imtransform(original,T));



cpselect(input, original);


fixedPoints = double(int32(fixedPoints));
movingPoints = double(int32(movingPoints));

syms c1 c2 c3 c4 c5 c6 c7 c8
eq1 = fixedPoints(1,1) - (c1 * movingPoints(1,1) + c2 * movingPoints(1,2) + c3 * movingPoints(1,1) * movingPoints(1,2) + c4);
eq2 = fixedPoints(1,2) - (c5 * movingPoints(1,1) + c6 * movingPoints(1,2) + c7 * movingPoints(1,1) * movingPoints(1,2) + c8);
eq3 = fixedPoints(2,1) - (c1 * movingPoints(2,1) + c2 * movingPoints(2,2) + c3 * movingPoints(2,1) * movingPoints(2,2) + c4);
eq4 = fixedPoints(2,2) - (c5 * movingPoints(2,1) + c6 * movingPoints(2,2) + c7 * movingPoints(2,1) * movingPoints(2,2) + c8);
eq5 = fixedPoints(3,1) - (c1 * movingPoints(3,1) + c2 * movingPoints(3,2) + c3 * movingPoints(3,1) * movingPoints(3,2) + c4);
eq6 = fixedPoints(3,2) - (c5 * movingPoints(3,1) + c6 * movingPoints(3,2) + c7 * movingPoints(3,1) * movingPoints(3,2) + c8);
eq7 = fixedPoints(4,1) - (c1 * movingPoints(4,1) + c2 * movingPoints(4,2) + c3 * movingPoints(4,1) * movingPoints(4,2) + c4);
eq8 = fixedPoints(4,2) - (c5 * movingPoints(4,1) + c6 * movingPoints(4,2) + c7 * movingPoints(4,1) * movingPoints(4,2) + c8);
s = solve(eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8);
c = [s.c1, s.c2, s.c3, s.c4, s.c5, s.c6, s.c7, s.c8];
c = double(c);

register = uint8(zeros(size(original))); 
OHeight = size(original , 1);
OWidth = size(original , 2);
IHeight = size(input , 1);
IWidth = size(input , 2);
for w = 1:IWidth
for v = 1:IHeight
x = round(c(5) * w + c(6) * v + c(7) * w * v + c(8)) ;
y = round(c(1) * w + c(2) * v + c(3) * w * v + c(4)) ;
if y >= 1 && y <= OWidth && x >=1 && x <= OHeight
register(x, y) = input(v , w); 
end        
end
end

figure;
subplot(221);
imshow(original);
subplot(222);
imshow(input);
subplot(223);
imshow(register);
subplot(224);
imshow(imabsdiff(register , original));