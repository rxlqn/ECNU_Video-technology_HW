face_dir = '.\orl_faces\';
[train_set,test_set] = imRead(face_dir);


%去均值
mean_face = mean(train_set(:,:)')';
train_set_mean = train_set - repmat(mean_face,1,320);
test_set_mean = test_set - repmat(mean_face,1,80);


%协方差
train_cov = train_set_mean' * train_set_mean ;
%test_cov = test_set * test_set' / (80 - 1);
[V,D] = eig(train_cov);

% 特征值越往后越大 , 取后两百个特征向量
highDim_V = train_set_mean * V;
highDim_V = highDim_V(:,121:320);
highDim_V = Norm(highDim_V);

train_V = highDim_V' * train_set_mean;


%重构测试
% test_img = test_set(:,1) - mean_face;
% 
% base = highDim_V'*test_img;
% rebuild = highDim_V * base;
% rebuild = rebuild + mean_face;
% rebuild = reshape(rebuild,112,92);
% imshow(uint8(rebuild));


% 重构测试
% test_img = train_set(:,1);
% 
% base = highDim_V'*test_img;
% rebuild = highDim_V * base;
% rebuild = rebuild + mean_face;
% rebuild = reshape(rebuild,112,92);
% imshow(uint8(rebuild));
