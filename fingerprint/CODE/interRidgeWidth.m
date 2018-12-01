function edgeDistance = interRidgeWidth(image,inROI,blocksize)
%Honors Project 2001~2002
%wuzhili 99050056
%comp sci HKBU
%last update 19/April/2002

[w,h] = size(image);

a=sum(inROI);

b=find(a>0);

c=min(b);
d=max(b);
i=round(w/5);
m=0;

for k=1:4
   m=m+sum(image(k*i,16*c:16*d));
end;
e=(64*(d-c))/m;

a=sum(inROI,2);
b=find(a>0);

c=min(b);
d=max(b);

i=round(h/5);
m=0;

for k=1:4
   m=m+sum(image(16*c:16*d,k*i));
end;
m=(64*(d-c))/m;

edgeDistance=round((m+e)/2);

   




