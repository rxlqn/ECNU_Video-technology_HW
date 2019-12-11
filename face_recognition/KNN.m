% test_img = test_set(:,1) - mean_face;
% base = highDim_V'*test_img;


test_V = highDim_V'*test_set_mean;

for j = 1:80
    for i = 1:320
        temp(:,i) = (test_V(:,j) - train_V(:,i)).^2;    
        dist(i) = sum(temp(:,i));
    end
    [num,index(j)] = min(dist);
    index(j) = ceil(index(j)/8);
end


count = 0;
for i = 1:80
    if index(i) == ceil(i/2)
        count = count + 1;
    end
end
accuracy = count/80;