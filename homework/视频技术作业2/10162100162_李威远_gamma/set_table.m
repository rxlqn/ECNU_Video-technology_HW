function [table]=set_table( gamma )
%建立查找表
%输入gamma校正的参数gamma，建立查找表table
for i = 1:255
   table(i) = (i/255)^gamma; 
end
end