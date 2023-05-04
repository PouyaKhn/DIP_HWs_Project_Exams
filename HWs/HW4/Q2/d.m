function d(img,img2)
% this function perform part 'd' of question 2
% this function calculate angle of rectangle and woman image
% this function calculate magnitude of rectangle and woman image
% this function show original woman image and phase of this image lonely
% and magnitude of this image lonely and show magnitude of woman + phase of
% rectangle and vice versal
% inputs: img: original image of rectangle, img2: original image of woman
% outputs: there is no output
    img = imresize(img,[512 512]);
    spectrum1 = fft2(double(img));
    spectrum2 = fft2(double(img2));
    
    phase1 = angle(spectrum1);
    phase2 = angle(spectrum2);
    
    mag1 = abs(spectrum1);
    mag2 = abs(spectrum2);
    
    figure;
    subplot(2,3,1);
    imshow(img2);
    title('woman');
    
    subplot(2,3,2);
    imshow(phase2,[]);
    title('woman phase');
    
    rec1 = ifft2(exp(1i*phase2));
    subplot(2,3,3);
    imshow(rec1,[]);
    title('rec with just phase');
    
    rec2 = ifftshift(ifft2(mag2));
    subplot(2,3,4);
    imshow(uint8(rec2));
    title('rec with just mag');
    
    rec3 = ifft2( mag1 .* exp(1i*phase2));
    rec4 = ifft2( mag2 .* exp(1i*phase1));
    
    subplot(2,3,5);
    imshow(rec3,[]);
    title('mag rect + phase woman');
    subplot(2,3,6);
    imshow(rec4,[]);
    title('mag woman + phase rect');
end

