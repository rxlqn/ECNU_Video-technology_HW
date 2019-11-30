function result_img = floyd_steinberg(img, dbits)
% input : image is the original image that you need to give. here you need
%         to consider both the color image and the gray one. In color image, each
%         of its channel ranges from 0-255(24 bits); in gray image, there is only
%         one channel ranging from 0-255(8 bits)
% input: dbits is the *final total bits* that you want to specify in the
%        result image. In gray image, it can be any integer value less than
%        8. In color image, it should be an interger value less than 24.
%        And it can also be divided by 3 (using the same bits count in the r'g'b' channel)
% output: result_image is the output image with the same dimensions as the
%         input.
% requirements: try to use your previous function "quantize_image". In this function, call that
% "quantize_image" first, then add the weighted error values to the later pixels. you should also
% write a main function to call "floyd_steinberg". and finally, you compute the psnr value in the main function. 

[r,c,ch] = size(img);

if ch == 1   %gray
    uint = [0 0 0
            0 1 0
            0 0 0];
    img = conv2(img,uint);  %À©±ß·ÀÖ¹Òç³ö
    result_img=quantize_image(img, dbits);

    for i = 2:r+1
        for j = 2:c+1
            quant_error = img(i,j)-result_img(i,j);
            result_img(i+1,j) = result_img(i+1,j)+ quant_error*7/16;
            result_img(i-1,j+1) = result_img(i-1,j+1) + quant_error*3/16;
            result_img(i,j+1) = result_img(i,j+1) + quant_error*5/16;
            result_img(i+1,j+1) = result_img(i+1,j+1) + quant_error*1/16;
        end
    end

else   % color
    dbits = dbits/3;
    for iter = 1:3
            uint = [0 0 0
            0 1 0
            0 0 0];
            img_conv = conv2(img(:,:,iter),uint);  %À©±ß·ÀÖ¹Òç³ö
            result_img=quantize_image(img_conv, dbits);

            for i = 2:r+1
                for j = 2:c+1
                    quant_error = img_conv(i,j)-result_img(i,j);
                    result_img(i+1,j) = result_img(i+1,j)+ quant_error*7/16;
                    result_img(i-1,j+1) = result_img(i-1,j+1) + quant_error*3/16;
                    result_img(i,j+1) = result_img(i,j+1) + quant_error*5/16;
                    result_img(i+1,j+1) = result_img(i+1,j+1) + quant_error*1/16;
                end
            end
            res(:,:,iter) = result_img;
    end
    result_img = res; 
end

% È¥³ý±ß¿ò
result_img = result_img(2:r+1,2:c+1,:);
end