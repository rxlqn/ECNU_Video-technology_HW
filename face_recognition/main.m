face_dir = '.\orl_faces\';
[train_set,test_set] = imRead(face_dir);

base = PCA(train_set);
%去均值
mean_face = mean(train_set(:,:)')';
train_set_mean = train_set - repmat(mean_face,1,320);
test_set_mean = test_set - repmat(mean_face,1,80);

%系数
train_factor = base' * train_set_mean;
test_factor = base'*test_set_mean;

%计算准确率
accuarcy_1 = KNN(1,train_factor,test_factor)
accuarcy_3 = KNN(3,train_factor,test_factor)

%重构测试  30个重构
% img = train_set_mean(:,1);
% factor = base'*img;
% rebuild = base * factor;
% rebuild = rebuild + mean_face;
% rebuild = reshape(rebuild,112,92);
% imshow(uint8(rebuild));
