function [o] = adaptiveThres(a,W,~)

[w,h] = size(a);
o = zeros(w,h);


for i=1:W:w
for j=1:W:h
mean_thres = 0;


if i+W-1 <= w && j+W-1 <= h
   	mean_thres = mean2(a(i:i+W-1,j:j+W-1));
      mean_thres = 0.8*mean_thres;
      o(i:i+W-1,j:j+W-1) = a(i:i+W-1,j:j+W-1) < mean_thres;
end;
   
end;
end;


