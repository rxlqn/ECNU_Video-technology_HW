function base = PCA(data_set)

%去均值
mean_face = mean(data_set(:,:)')';
data_set_mean = data_set - repmat(mean_face,1,320);

%协方差
Cov = data_set_mean' * data_set_mean ;
[V,~] = eig(Cov);

% 特征值越往后越大 , 取后30个特征向量
highDim_V = data_set_mean * V;
highDim_V = highDim_V(:,291:320);
highDim_V = Norm(highDim_V);

base = highDim_V;
end