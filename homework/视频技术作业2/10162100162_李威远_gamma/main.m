clear all
close all
img=imread('lena.jpg');
% figure;
% imshow(img);
img=double(img);
img=img./255.00;
luma_table=set_table(1.6);%�������ұ�����ֵΪgamma����ֵ

tic
adjustedimg=gamma_adjust(img,luma_table);%����������һ��һ������ѭ������
toc
adjustedimg=adjustedimg.*255.00;
adjustedimg=uint8(adjustedimg);
figure;
imshow(adjustedimg);
