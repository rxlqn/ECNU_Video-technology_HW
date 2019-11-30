function [ pseudo_indx ] = calculate_pseudo_indx( img, r_val,g_val,b_val )
% ThIS function calculates the index value for each pixel in the true color
% image.
% input: true_clr_img, 24bits for each pixel, (w*h*3). 
% input: CLUT, color look-up-table, consisting of the browser safe pseudo color table (216*3)
% output: pseudo_indx, pseudo index matrix. Each value ranging from 1-216

[r,c,ch] = size(img);


%r channel
for i = 1:6         %distance
    dist(:,:,i) = (img(:,:,1)-r_val(i)).^2;
end

for i = 1:r         %index
    for j = 1:c
        [num,index_r(i,j)] = min(dist(i,j,:));    
    end
end

%g channel
for i = 1:6         %distance
    dist(:,:,i) = (img(:,:,2)-g_val(i)).^2;
end

for i = 1:r         %index
    for j = 1:c
        [num,index_g(i,j)] = min(dist(i,j,:));    
    end
end

%b channel
for i = 1:6         %distance
    dist(:,:,i) = (img(:,:,3)-b_val(i)).^2;
end

for i = 1:r         %index
    for j = 1:c
        [num,index_b(i,j)] = min(dist(i,j,:));    
    end
end
pseudo_indx = (index_r-1)*36+(index_g-1)*6+index_b;

end

