% �������ֱ���ñ�д�������������ȼ���任��ͼ����ԭʼͼ��֮��ķ�ֵ�����
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