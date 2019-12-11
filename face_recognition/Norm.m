function m = Norm(m)
for i = 1:size(m,2)
   m(:,i) = m(:,i)/norm(m(:,i));
end
end