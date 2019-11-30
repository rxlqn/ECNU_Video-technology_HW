function [Y,Cb,Cr]=DownSampling420(ycbcr)
%input ycbcr: 3 channel image (h*w*3) of 4:4:4
%output Y: one channel image (h*w); Cb: one channel image {(h/2)*(w/2)};
%Cr: one channel image with the same size as Cb
Y = ycbcr(:,:,1);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);

[r,c] = size(cb);
for i = 1:r/2
    for j = 1:c/2
        Cb(i,j) = 1/4*(cb(i*2-1,j*2-1)+cb(i*2-1,j*2)+cb(i*2,j*2-1)+cb(i*2,j*2));
    end
end
for i = 1:r/2
    for j = 1:c/2
        Cr(i,j) = 1/4*(cr(i*2-1,j*2-1)+cr(i*2-1,j*2)+cr(i*2,j*2-1)+cr(i*2,j*2));
    end
end
        

end