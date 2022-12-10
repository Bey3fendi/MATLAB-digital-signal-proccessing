% clear all
% img=imread("resim 2.jpg");%desired image is added
% imshow(img)
%split into photo layers
% red=img(:,:,1); green=img(:,:,2); blue=img(:,:,3);
%With color thresholding(impixel command), a matrix array with pixel pitches of the place to be selected in the photo is found and examined.
% % d=impixel(img);
%Pixel intervals are determined according to the color pixels of the part to be separated.
% nehir_aralik= red>150 & red<190 & green>180 & green<235 & blue>215;
%I used the cat command and a lightweight algorithm to recolor the part we separated.
% nehir_aralik=uint8(nehir_aralik);
% katman_3=cat(3,nehir_aralik,nehir_aralik,nehir_aralik);
% renkli_nehir=katman_3.*img;
