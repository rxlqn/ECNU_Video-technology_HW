function accuracy = KNN(K,train_V,test_V)

for j = 1:80
    for i = 1:320
        temp(:,i) = (test_V(:,j) - train_V(:,i)).^2;  %ŷ�Ͼ���  
        dist(i) = sum(temp(:,i));
    end
    [sort_dist,sort_index] = sort(dist);         
    min_index = sort_index(1:K);     %ȡ������С��k�����±�
    index(j) = mode(min_index);      %ȡ����
%     [num,index(j)] = min(dist);
    index(j) = ceil(index(j)/8);
end

count = 0;
for i = 1:80
    if index(i) == ceil(i/2)
        count = count + 1;
    end
end
accuracy = count/80;

end