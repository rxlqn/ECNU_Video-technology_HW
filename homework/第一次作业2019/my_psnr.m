function PSNR = my_psnr(img_o,img_r)
%��������ͼ��ķ�ֵ�����
k = 8;
%kΪͼ���Ǳ�ʾ�ظ����ص����õĶ�����λ������λ�
fmax = 2.^k - 1;
a = fmax.^2;
b = mean(mean(mean((img_o - img_r).^2)));
PSNR = 10*log10(a/b);
 
end
