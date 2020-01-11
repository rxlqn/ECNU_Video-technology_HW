function [ u v H ] = pyramidFlow( A, B_in, winSize, ITER_NO, PYRE_NO )
%This function find the optical flow from A to B using pyramid
%representation and iteration
%To handle the pixels on the borders, a smaller window is used
%PYRE_NO : total number of pyramid levels
%ITER_NO : number of iterations at each pyramid level
%G : Gaussian kernel for smoothing
[ A, B_in ] = sizeCheck( A, B_in, PYRE_NO ); %size check for A and B_in; Both height and width should be integer at each pyramid level;
    
[ Apyre, Bpyre, HalfWindow ] = pyramidInit( A, B_in, PYRE_NO, winSize );% Apre and Bpre are two pyramids;
for p = PYRE_NO:-1:1 %loop for pyramid levels
    fprintf('Pyramid level: %d\n',p)
    
    A = imReflect( Apyre{p}, HalfWindow );%borad line processing; reflect padding;
    B = Bpyre{p};
    
   
    if p == PYRE_NO % at higher pyramid level; initialize optical flow; the same size with Apyre{PYRE_NO}
        u = zeros(size( Apyre{p} ));
        v = zeros(size( Apyre{p} ));
        flag_ = 0; % flag for warping
    end  
    %Generating the Hessian matrices for this level
    for k = 1:ITER_NO        
        fprintf('Iteration no: %d\n',k)
        
        %Calculate a single LK step
        
        if flag_ ~= 0
            B = imWarp( u, v, Bpyre{p} );% warping on B
        else
            flag_ = 1;
        end
   
        B_ref = imReflect(B, HalfWindow);
        
        [Ix Iy] = gradient( B_ref );%calculate simple gradient (matlab function);
        H  = Hmatrix( Ix, Iy, HalfWindow, 0.001 );% H(a,b,c,d) 4D matrix
        
        It = A - B_ref;%time difference -It
        
        [us vs] = LKstep(It, Ix, Iy, H, HalfWindow);
                 
        us = us(HalfWindow+1:size(us,1)-HalfWindow, HalfWindow+1:size(us,2)-HalfWindow);
        vs = vs(HalfWindow+1:size(vs,1)-HalfWindow, HalfWindow+1:size(vs,2)-HalfWindow);   
       
        u = u + us;
        v = v + vs;
    end
       
    if p ~= 1 %until the last pyramid
        u = 2 * imresize(u,size(u)*2,'bilinear');
        v = 2 * imresize(v,size(v)*2,'bilinear');
    end
    
end
end
