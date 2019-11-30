function [ PSNR ] = calculate_PSNR( img_o, img_r )
% This function calculates PSNR.
% Input: original image in org_img, and reconstruction image in rec_img.
% Ouput: a single PSNR value

img_o = double(img_o);
img_r = double(img_r);
%��������ͼ��ķ�ֵ�����
k = 8;
%kΪͼ���Ǳ�ʾ�ظ����ص����õĶ�����λ������λ�
fmax = 2.^k - 1;
a = fmax.^2;
b = mean(mean(mean((img_o - img_r).^2)));
PSNR = 10*log10(a/b);
 
end