function [table]=set_table( gamma )
%�������ұ�
%����gammaУ���Ĳ���gamma���������ұ�table
for i = 1:255
   table(i) = (i/255)^gamma; 
end
end