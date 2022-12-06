%Here, filter retrieval applications are not made using direct matlab commands such as medfilt, but by for loops by revealing the mathematical model of these filters. 
  
  
% %MEAN RECEVİER
 %[data,fs]= audioread("noisyspeech.wav");
%  %data=[1;2;5;4]; %gözlem datası
% 
% 
% M=input("filtre uzunlugunu giriniz:  ");
% eklenecek=zeros(M-1,1);
% newdata=[data;eklenecek];
% x=0;
% a=0;
% b=0;
% y=1;
% output=zeros(length(data),1);
% 
% for  i = 1:1:length(newdata)-(M)
% x=i;
% for u = 1:1:M
% y=newdata(x);  
% a=a+y;
% x=x+1; 
% end
% 
% c=a/M;
% output(i)=c;
% a=0;
% end
% sound(output,fs) 
% 
% t=linspace(0,length(output)/fs,length(output));
% figure
% plot(t,output)
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %MEDİAN FİLTER
% [data,fs]= audioread("noisyspeech.wav");
% 
%   %data=[1;2;3;4;5;6;7;8]; %gözlem datası
% 
% 
% M=input("filtre uzunlugunu giriniz:  ");
% eklenecek=zeros(M-1,1);
% newdata=[data;eklenecek];
% x=0;
% a=0;
% b=0;
% y=1;
% output=zeros(length(data),1);
% A=zeros(M,1);
% 
% for  i = 1:length(newdata)-(M-1)
% x=i;
% for u = 1:1:M
% y=newdata(x);
% A(u)=y;
% x=x+1; 
% end
% 
% c=median(A);
% output(i)=c;
% c=0;
% A=zeros(M,1);
% end
% sound(output,fs) 
% 
% t=linspace(0,length(output)/fs,length(output));
% figure
% plot(t,output)
% 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% 
% %üstel kayan ortalama alıcı
% 
%  [data,fs]= audioread("noisyspeech.wav");
% %   data=[1;2;3;4;5;6;7;8]; %gözlem datası
% 
% 
% 
% M=input("filtre uzunlugunu giriniz:  ");
% eklenecek=zeros(M-1,1);
% newdata=[data;eklenecek];
% x=0;
% a=0;
% b=0;
% y=1;
% ustel=0.5;
% output=zeros(length(data),1);
% 
% for  i = 1:length(newdata)-(M-1)
% x=i;
% for u = 1:1:M
% y=newdata(x);
% y=y*ustel^(u-1);
% a=a+y;
% x=x+1; 
% end
% 
% c=a/M;
% output(i)=c;
% a=0;
% end
%   sound(output,fs) 
% % 
%   t=linspace(0,length(output)/fs,length(output));
%   figure
%   plot(t,output)
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% %  
