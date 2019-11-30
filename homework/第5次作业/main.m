% rgb=double(imread('lena.jpg'));
rgb=(imread('lena.jpg'));
figure;
% imshow(rgb/255);

%%please organize the main fucntion in a elegant way. You should show both the
%%orignal image and the reconstructed image. PSNR value should be
%%calculated.


[ycbcr]=RGB2YCBCR(rgb);
[Y,Cb,Cr]=DownSampling420(ycbcr);

 ycbcr=UpSampling420(Y,Cb,Cr);
 

 rgb_rebuild= YCBCR2RGB(ycbcr);
 subplot 121
 imshow(rgb);

 subplot 122
 imshow(rgb_rebuild);
 
 psnr = PSNR(rgb,rgb_rebuild);