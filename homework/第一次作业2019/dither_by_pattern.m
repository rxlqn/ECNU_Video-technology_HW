function dimg=dither_by_pattern(img, pattern_size)
%input: img orignal gray scale image ranging from [0, 255], coded with
%8bits or color image with 3 channels;
%pattern_size: the size of the pattern for dither, 8 indicates 8X8;
%output: dimg, binary image

iter = log2(pattern_size-2);

M1 = [0 2
      3 1];

Mn = M1;
for i = 1:iter      %循环一次
   [r,c] = size(Mn);
   Un = ones(r,c);
   Mnn = [4*Mn 4*Mn+2*Un
         4*Mn+3*Un 4*Mn+Un];
   Mn = Mnn;
end


[rm,cm] = size(Mn);
[r,c] = size(img);


img = bitshift(img,log2(rm*rm)-8); %右移减少图标大小

dimg = ones(rm*r,cm*c);
for i = 1:r
    for j = 1:c
        temp = Mn;
        temp(temp<=img(i,j)) = 255;
        temp(temp~=255) = 0;

        dimg((i-1)*rm+1:i*rm,(j-1)*cm+1:j*cm) = temp;
    end
end

end
