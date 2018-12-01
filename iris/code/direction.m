function [p,z] = direction(image,blocksize,~)

[w,h] = size(image);
direct = zeros(w,h);
gradient_times_value = zeros(w,h);
gradient_sq_minus_value = zeros(w,h);
gradient_for_bg_under = zeros(w,h);

W = blocksize;
theta = 0;
sum_value = 1;
bg_certainty = 0;

blockIndex = zeros(ceil(w/W),ceil(h/W));


times_value = 0;
minus_value = 0;

center = [];


filter_gradient = fspecial('sobel');
I_horizontal = filter2(filter_gradient,image);

filter_gradient = transpose(filter_gradient);
I_vertical = filter2(filter_gradient,image);


gradient_times_value=I_horizontal.*I_vertical;
gradient_sq_minus_value=(I_vertical-I_horizontal).*(I_vertical+I_horizontal);
gradient_for_bg_under = (I_horizontal.*I_horizontal) + (I_vertical.*I_vertical);

%figure,imshow(gradient_times_value)
%figure,imshow(gradient_sq_minus_value)
%figure,imshow(gradient_for_bg_under)

for i=1:W:w
    for j=1:W:h
        if j+W-1 < h & i+W-1 < w
            times_value = sum(sum(gradient_times_value(i:i+W-1, j:j+W-1)));
            minus_value = sum(sum(gradient_sq_minus_value(i:i+W-1, j:j+W-1)));
            sum_value = sum(sum(gradient_for_bg_under(i:i+W-1, j:j+W-1)));
            
            bg_certainty = 0;
            theta = 0;
            
            if sum_value ~= 0 & times_value ~=0
                bg_certainty = (times_value*times_value + minus_value*minus_value)/(W*W*sum_value);
                
                if bg_certainty > 0.05
                    blockIndex(ceil(i/W),ceil(j/W)) = 1;
                    
                    tan_value = atan2(2*times_value,minus_value);
                    
                    
                    theta = (tan_value)/2 ;
                    theta = theta+pi/2;
                    center = [center;[round(i + (W-1)/2),round(j + (W-1)/2),theta]];
                end;
            end;
        end;
        times_value = 0;
        minus_value = 0;
        sum_value = 0;
        
    end;
end;

x = bwlabel(blockIndex,4);

y = bwmorph(x,'close');

z = bwmorph(y,'open');
p = bwperim(z);
figure, imshow(p)

