function ycbcr=UpSampling420(Y,Cb,Cr)
%input Y: one channel image (h*w); Cb: one channel image {(h/2)*(w/2)};
%Cr: one channel image with the same size as Cb
%output ycbcr: 3 channel image (h*w*3) of 4:4:4

[r,c] = size(Cb);
for i = 1:r
    for j = 1:c
        up_sample_Cb(i*2-1,j*2-1) = Cb(i,j);
        up_sample_Cb(i*2-1,j*2) = Cb(i,j);
        up_sample_Cb(i*2,j*2-1) = Cb(i,j);
        up_sample_Cb(i*2,j*2) = Cb(i,j);
    end
end
for i = 1:r
    for j = 1:c
        up_sample_Cr(i*2-1,j*2-1) = Cr(i,j);
        up_sample_Cr(i*2-1,j*2) = Cr(i,j);
        up_sample_Cr(i*2,j*2-1) = Cr(i,j);
        up_sample_Cr(i*2,j*2) = Cr(i,j);
    end
end

ycbcr(:,:,1) = Y;
ycbcr(:,:,2) = up_sample_Cb;
ycbcr(:,:,3) = up_sample_Cr;

end
