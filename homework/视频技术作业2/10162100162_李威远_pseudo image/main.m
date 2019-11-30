% this is the main function
% 1. you need to first read in a color image.
% 2. then you construct the CLUT with the function named by construct_CLUT()
% 3. then call the function named by calculate_pseudo_indx() to obtain the
% index matrix
% 4. then call the function named by get_pseudo_image() to retrieves a pseudo
% color image.
% 5. then in the main function, display the image returned by
% get_pseudo_image
% you can begin like this
clear
r_val = [0, 51, 102, 153, 204, 255];
g_val = r_val;
b_val = r_val;
img=imread('lena.jpg');
img=double(img);
CLUT = construct_CLUT( r_val, g_val, b_val );

pseudo_indx = calculate_pseudo_indx(img, r_val,g_val,b_val );


[ p_img ] = get_pseudo_image( img,pseudo_indx, CLUT );
imshow(uint8(p_img));
%here show p_img with imshow() function
[ PSNR ] = calculate_PSNR( img, p_img )


