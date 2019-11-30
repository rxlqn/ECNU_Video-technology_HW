function [ p_img ] = get_pseudo_image( img,pseudo_indx, CLUT )
%this function returns the pseudo color image represented by the index and
%the CLUT.
%input: pseudo_indx, 2d matrix. each element represents the index value for CLUT 
%input: CLUT, color look-up-table, consisting of the browser safe pseudo color table (216*3)
%output: pseudo image.(w*h*3), each pixel value retrieves from the CLUT¡£

[r,c,ch] = size(img);
for i = 1:r
    for j = 1:c
        
        p_img(i,j,1) = CLUT(pseudo_indx(i,j)).r;
        p_img(i,j,2) = CLUT(pseudo_indx(i,j)).g;
        p_img(i,j,3) = CLUT(pseudo_indx(i,j)).b;


    end
end
end


