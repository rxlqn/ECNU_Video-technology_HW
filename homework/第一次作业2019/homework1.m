img = imread('lena.bmp');
img_color = imread('lena.jpg');

subplot 231
imshow(img);
title("original image");
img = double(img);


%%  quant
qimg=quantize_image(img, 3);
PSNR = my_psnr(double(img),double(qimg));
subplot 232
imshow(qimg);
T =  sprintf('Quantize image PSNR = %.2f',PSNR);
title(T);

%%  dither
dimg = dither_by_pattern(img, 8);
subplot 233
imshow(uint8(dimg));
title("dither by pattern");


%%  Floyd_Steinberg
subplot 234
result_img = floyd_steinberg(img, 3);
PSNR = my_psnr(double(result_img),double(img));
imshow(result_img);
T =  sprintf('Floyd Steinberg gray PSNR = %.2f',PSNR);
title(T);


subplot 235
imshow(img_color);
title("color image");

subplot 236
result_img = floyd_steinberg(img_color, 9);
PSNR = my_psnr(double(result_img),double(img_color));
imshow(result_img);
T =  sprintf('Floyd Steinberg color PSNR = %.2f',PSNR);
title(T);    

