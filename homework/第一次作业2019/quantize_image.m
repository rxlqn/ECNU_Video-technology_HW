function qimg=quantize_image(img, bits)
% input: img: the orignal gray scale image ranging from [0, 255], coded with 8bits
%        bits: number of the bits that we want to use for the result image, less than (or equal) 8bits but larger than 0 
% output qimg: with the same size as input img, still ranging from [0,255], but coded with less bits (less graylevels) 
qimg = bitshift(img,bits-8);
qimg = qimg/max(max(qimg))*255;
qimg = uint8(qimg);


end
       