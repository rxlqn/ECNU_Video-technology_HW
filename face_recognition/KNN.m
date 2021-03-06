function accuracy = KNN(K,train_V,test_V)


count = 0;

index = ones(1,80);
temp = ones(30,320);

for j = 1:80
    for i = 1:320
        temp(:,i) = (test_V(:,j) - train_V(:,i)).^2;  %欧氏距离  
        dist(i) = sum(temp(:,i));
    end
    [~,sort_index] = sort(dist);         
    min_index = sort_index(1:K);     %取距离最小的k个的下标
    min_index = ceil(min_index/8);    
    index(j) = mode(min_index);      %取众数
    if index(j) == ceil(j/2)
        count = count + 1;
    end
end

accuracy = count/80;

end