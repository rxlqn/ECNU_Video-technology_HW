function [ PSNR ] = calculate_PSNR( img_o, img_r )
% This function calculates PSNR.
% Input: original image in org_img, and reconstruction image in rec_img.
% Ouput: a single PSNR value

img_o = double(img_o);
img_r = double(img_r);
%计算两幅图像的峰值信噪比
k = 8;
%k为图像是表示地个像素点所用的二进制位数，即位深。
fmax = 2.^k - 1;
a = fmax.^2;
b = mean(mean(mean((img_o - img_r).^2)));
PSNR = 10*log10(a/b);
 
end