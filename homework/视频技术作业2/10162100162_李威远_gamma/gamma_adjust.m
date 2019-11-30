function [img_after]=gamma_adjust(img_before,table)
%image_before是gamma校正前的函数
%table是查找表
%使用此函数完成查表的过程
img_after = table(uint8(img_before*255)+1);
end