% 主函数分别调用编写的三个函数，比计算变换后图像与原始图像之间的峰值信噪比
clear all
close all
img = imread('lena.jpg');


subplot 131
imshow(img);
img=double(img);

subplot 132
result=control_brightness(img, 50);
PSNR = my_psnr(result,img);
imshow(result);
t = sprintf('PSNR = %.1f',PSNR);
title(t);

subplot 133
result=control_contrast(img, 50);
PSNR = my_psnr(result,img);
imshow(result);
t = sprintf('PSNR = %.1f',PSNR);
title(t);