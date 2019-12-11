function [train_set,test_set] = imRead(face_dir)
face_struct = dir(face_dir);       

for i = 4:43         %从4开始是人脸
   s_dir = strcat(face_struct(i).folder,'\',face_struct(i).name);
   data_struct = dir(s_dir);
   for j = 3:12      %从3开始   前8张训练集，后2张测试集
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


