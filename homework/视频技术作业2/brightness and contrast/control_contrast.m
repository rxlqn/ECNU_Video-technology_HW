function result=control_contrast(img, levels)
% input: img: the orignal gray scale image ranging from [0, 255], coded with 8bits
%        levels: integer value. the parameter controls the brightness, ranging from [-100, 100]
% output result: with the same size as input img, still ranging from [0,255], but the brightness is controled by the input levels

result = img - 127.5;
if levels == 100
    result = 1000*result;
else
    if levels<0
        gain = 1+levels/100;
        
    else
        gain = 1/(1-levels/100);
        
    end
    result = gain*result+127.5;
end
result = uint8(result);




end