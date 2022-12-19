clc
clear all
close all
%The video file was imported into matlab.
fidyo = VideoReader('turkey.mp4');
vid = read(fidyo);
%videoya ait frame
frames=fidyo.NumberOfFrames;
%Frames requested by the user are saved in jpg format.
frametophoto=" .jpg"
file=dir("C:\Users\FURKAN\Desktop\sınıf 4 donem 1\sayisal isaret isleme\miniproje\soru7\*.jpg")

%frameleri for döngüsü ile okutup yazacağız;
for i=1:10
%     i=input("hangi frame? ");
    %integerdan stringe çevireceğiz
    string=num2str(i);
    %2 string dosyasını birleştiriyoruz;
    stringc= strcat(string,frametophoto);
    Vid=vid(:,:,:,i);
    

    %exporting the frames
    imwrite(Vid,stringc);
end
for u=1:lenght(file)
    dosyaismi=strcat("C:\Users\FURKAN\Desktop\sınıf 4 donem 1\sayisal isaret isleme\miniproje\soru7\",file(u).name);
    A=imread(dosyaismi);
    figure, imshow(A);
    path=strcat("C:\Users\FURKAN\Desktop\sınıf 4 donem 1\sayisal isaret isleme\miniproje\soru7\kayit\",file(u).name);
    imwrite(A,path);
    end
