function [ CLUT ] = construct_CLUT( r_val, g_val, b_val )
%This function forms the CLUT.
%r_val: input, code values that are available in the Red channel
%g_val: input, code values that are available in teh grean channel
%b_val: input, code values that are available in teh blue channel
%CLUT: Output, color look up table.
%you can construct the CLUT within 3 for loops. hopefully, it won't take u
%much time.

for i = 1:6
    for j = 1:6
        for k = 1:6
            CLUT((i-1)*36+(j-1)*6+k).r = r_val(i);
            CLUT((i-1)*36+(j-1)*6+k).g = g_val(j);
            CLUT((i-1)*36+(j-1)*6+k).b = b_val(k);
        end
    end
end

            
            

end





