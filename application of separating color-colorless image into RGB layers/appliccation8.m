img=imread("2df3b72da4ffe8.jpg");
imshow(img)
  
%We have assigned each layer of the image to a separate matrix with the following line
red=img(:,:,1); green=img(:,:,2); blue=img(:,:,3);

%these layers were used to create the black and white image
siyahbeyaz= double(red)+double(green)+double(blue);
siyahbeyaz=uint8(siyahbeyaz);
imshow(siyahbeyaz)

%Below is the step of splitting the image into layers.

siyahkatman=zeros(567,800);
% siyahkatman=uint8(siyahkatman);

kirmizikatman=cat(3,red,siyahkatman,siyahkatman);
yesilkatman=cat(3,siyahkatman,green,siyahkatman);
mavikatman=cat(3,siyahkatman,siyahkatman,blue);

figure
imshow(kirmizikatman)
figure
imshow(yesilkatman)
figure
imshow(mavikatman)
