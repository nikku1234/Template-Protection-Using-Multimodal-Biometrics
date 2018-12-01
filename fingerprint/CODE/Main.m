clc;
clear all;
close all;

InImage1=imread('3.tif');
figure, imshow(InImage1)

InImage_double = 255-double(InImage1);

[Row,col,dim]=size(InImage1);

Histo_Image=histeq(uint8(InImage_double));
figure, imshow(Histo_Image)

FFTImage=fftenhance(Histo_Image,0.5);

Binarized_Image=adaptiveThres(double(FFTImage),32);

[o1Bound,o1Area]=direction(Binarized_Image,16);

[o2,o1Bound,o1Area]=drawROI(Binarized_Image,o1Bound,o1Area);

Thin_Image=im2double(bwmorph(o2,'thin',Inf));

figure, imshow(~Thin_Image)

Removed_H=im2double(bwmorph(Thin_Image,'clean'));

Removed_H=im2double(bwmorph(Removed_H,'hbreak'));
figure, imshow(~Removed_H)

[end_list1,branch_list1,ridgeMap1,edgeWidth]=mark_minutia(Removed_H,o1Bound,o1Area,16);
show_minutia(~Removed_H,end_list1,branch_list1);