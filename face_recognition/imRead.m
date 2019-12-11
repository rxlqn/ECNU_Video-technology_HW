function [train_set,test_set] = imRead(face_dir)
face_struct = dir(face_dir);       

for i = 4:43         %��4��ʼ������
   s_dir = strcat(face_struct(i).folder,'\',face_struct(i).name);
   data_struct = dir(s_dir);
   for j = 3:12      %��3��ʼ   ǰ8��ѵ��������2�Ų��Լ�
        data_dir = strcat(data_struct(j).folder,'\',data_struct(j).name);
        img = imread(data_dir);
        img = reshape(img,size(img,1)*size(img,2),1);
        if(j<=10)
            train_set(:,(i-4)*8 + j-3 + 1) = img; 
        else
            test_set(:,(i-4)*2 + j-11 + 1) = img; 
        end
   end
end
train_set = double(train_set) ;
test_set = double(test_set) ;

end


