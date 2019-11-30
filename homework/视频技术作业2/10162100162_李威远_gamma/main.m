clear all
close all
img=imread('lena.jpg');
% figure;
% imshow(img);
img=double(img);
img=img./255.00;
luma_table=set_table(1.6);%建立查找表，输入值为gamma参数值

tic
adjustedimg=gamma_adjust(img,luma_table);%调整函数，一个一个像素循环方法
toc
adjustedimg=adjustedimg.*255.00;
adjustedimg=uint8(adjustedimg);
figure;
imshow(adjustedimg);
