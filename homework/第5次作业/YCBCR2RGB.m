function rgb= YCBCR2RGB(ycbcr)
%input ycbcr: 3 channel image (h*w*3)
%output rgb: 3 channel image (h*w*3)
 TR=[65.481,128.553,24.966;-37.797,-74.203,112;112,-93.786,-18.214];
offset=[16;128;128];

[r,c,ch]=size(ycbcr);
for i = 1:r
    for j = 1:c
        rgb(i,j,:) = inv(TR)*([ycbcr(i,j,1);ycbcr(i,j,2);ycbcr(i,j,3)] - offset);
    end
end
rgb = uint8(rgb*255);
