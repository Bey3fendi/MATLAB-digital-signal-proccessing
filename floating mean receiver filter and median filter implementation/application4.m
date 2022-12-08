img=imread("resim 1.jpg");
%imshow(img)
imgsyhbyz=rgb2gray(img);%We removed the RGB layer to make the process easier to handle.

 %imgsyhbyz=rand(3);%gözlem datası

%floating average receiver filter
M=input("filtre uzunlugunu giriniz:  ");%filter length is taken from user
eklenecek=zeros(M-1,length(imgsyhbyz));%In order to avoid data loss as a result of the filter and to get the filter properly, zero as much as one minus the filter length is added to the data to which the filter will be applied. 
newdata=[imgsyhbyz;eklenecek];%performing zero padding for the aforementioned reason
x=0;
a=0;
z=0;
b=0;
y=1;
k=1;
output=zeros(length(imgsyhbyz),length(imgsyhbyz));

for k=1:length(newdata)-(M-1)
z=k;    
for  i = 1:length(newdata)-(M-1)
x=i;
for u = 1:1:M
y=newdata(x,z);
a=a+double(y);
x=x+1; 
end

c=a/M;
output(i,z)=c;
a=0;
end
end

%Our filter has been applied. Now we will convert the data from double format to uint8 format so that we can observe the filtered data.
%  outputint=uint8(output)

figure
imshow(outputint)










img=imread("resim 1.jpg");
%imshow(img)
imgsyhbyz=rgb2gray(img); %We removed the RGB layer to make the process easier to handle.

 %imgsyhbyz=rand(3);%gözlem datası

%median filter;
M=input("filtre uzunlugunu giriniz:  ");%filter length is taken from user
eklenecek=zeros(M-1,length(imgsyhbyz));%In order to avoid data loss as a result of the filter and to get the filter properly, zero as much as one minus the filter length is added to the data to which the filter will be applied. 
newdata=[imgsyhbyz;eklenecek];%performing zero padding for the aforementioned reason
x=0;
a=0;
z=0;
b=0;
y=1;
k=1;
output=zeros(length(imgsyhbyz),length(imgsyhbyz));
A=zeros(M,1);

for k=1:length(newdata)-(M-1)
z=k;    
for  i = 1:length(newdata)-(M-1)
x=i;
for u = 1:1:M
y=newdata(x,z);
A(u)=y;
x=x+1; 
end

c=median(A);
output(i,z)=c;
c=0;
A=zeros(M,1);
end
end

%Our filter has been applied. Now we will convert the data from double format to uint8 format so that we can observe the filtered data.
%  outputint=uint8(output)
figure
imshow(outputint)













img=imread("resim 1.jpg");
%imshow(img)
imgsyhbyz=rgb2gray(img); %We removed the RGB layer to make the process easier to handle.

 %imgsyhbyz=rand(3);%gözlem datası

% exponential floating average receiver filter
M=input("filtre uzunlugunu giriniz:  "); %filter length is taken from user
eklenecek=zeros(M-1,length(imgsyhbyz)); %In order to avoid data loss as a result of the filter and to get the filter properly, zero as much as one minus the filter length is added to the data to which the filter will be applied. 
newdata=[imgsyhbyz;eklenecek];%performing zero padding for the aforementioned reason
x=0;
a=0;
z=0;
b=0;
y=1;
k=1;
ustel=0.5; %The exponential value must be between 0-1. we will choose 0.5 in this application.
output=zeros(length(imgsyhbyz),length(imgsyhbyz));

for k=1:length(newdata)-(M-1)
z=k;    
for  i = 1:length(newdata)-(M-1)
x=i;
for u = 1:1:M
y=newdata(x,z);
y=y*ustel^(u-1);
a=a+double(y);
x=x+1; 
end

c=a/M;
output(i,z)=c;
a=0;
end
end

%Our filter has been applied. Now we will convert the data from double format to uint8 format so that we can observe the filtered data.
%  outputint=uint8(output)
figure
imshow(outputint)
