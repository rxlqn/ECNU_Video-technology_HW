function base = PCA(data_set)

%ȥ��ֵ
mean_face = mean(data_set(:,:)')';
data_set_mean = data_set - repmat(mean_face,1,320);

%Э����
Cov = data_set_mean' * data_set_mean ;
[V,~] = eig(Cov);

% ����ֵԽ����Խ�� , ȡ��30����������
highDim_V = data_set_mean * V;
highDim_V = highDim_V(:,291:320);
highDim_V = Norm(highDim_V);

base = highDim_V;
end