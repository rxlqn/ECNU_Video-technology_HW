function [img_after]=gamma_adjust(img_before,table)
%image_before��gammaУ��ǰ�ĺ���
%table�ǲ��ұ�
%ʹ�ô˺�����ɲ��Ĺ���
img_after = table(uint8(img_before*255)+1);
end