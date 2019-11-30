function [ycbcr]=RGB2YCBCR(rgb_img)
%½«RGB×ª»»Îªycbcr
[h w z]=size(rgb_img);
ycbcr=zeros(h,w,z);
TR=[65.481,128.553,24.966;-37.797,-74.203,112;112,-93.786,-18.214];
offset=[16;128;128];

rgb_img=double(rgb_img);
rgb_img=rgb_img./255.0;
for i=1:h
    for j=1:w
        ycbcr(i,j,:)=TR*[rgb_img(i,j,1);rgb_img(i,j,2);rgb_img(i,j,3)]+offset;
    end
end
end