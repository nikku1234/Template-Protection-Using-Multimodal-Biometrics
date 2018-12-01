function show_minutia(image,end_list,branch_list);

%show the image of all points in the list
%Honors Project 2001~2002
%wuzhili 99050056
%comp sci HKBU
%last update 19/April/2002


%[x,y] = size(end_list);
%imag = zeros(200,200);
%imag = image;
%x
%for i=1:x
%	xx = end_list(i,1);
%	yy = end_list(i,2);
%
%	imag(xx-2:xx+2,yy-2:yy+2) = 1;
%	imag(xx,yy) = 0;
%end;


%[x,y] = size(branch_list);
%for i = 1:x
%  	xx = branch_list(i,1);
%	yy = branch_list(i,2);

%	imag(xx-2:xx+2,yy-2:yy+2) = 1;
%	imag(xx-1:xx+1,yy-1:yy+1) = 0;
	%imag(xx,yy) = 0;
%end;

%figure;
colormap(gray);imagesc(image);
hold on;

if ~isempty(end_list)

plot(end_list(:,2),end_list(:,1),'*r');
if size(end_list,2) == 3
   hold on
	[u,v] = pol2cart(end_list(:,3),10);
	quiver(end_list(:,2),end_list(:,1),u,v,0,'g');
end;
end;

if ~isempty(branch_list)
hold on
plot(branch_list(:,2),branch_list(:,1),'+y');
end;



	
