%1)import the video in matlab
ana_video = VideoReader("deneme9.avi");
%video frame sayısının bir değişkene atanması
frame_sayisi=ana_video.NumFrames;

%moving objects seperated from background with foregrounddetector.
arac_tespiti=vision.ForegroundDetector("NumGaussians", 3, "NumTrainingFrames", 10, "InitialVariance", 20*20);
%"NumTrainingFrames" if cars are coming up early phase in video you should lower that value
%"InitialVariance" 20*20 value is so ideal for every traffic video
                                                       


for i=1:1:400
%reading first 400 frame the video and import that into frameler variables. 
frameler=readFrame(ana_video);
%in there thanks to do step function every frame send to the arac_Tespiti variable.
nesneler=step(arac_tespiti, frameler);
end

%test foreground detector.
%frame'in kendisi
figure
imshow(frameler);
impixelinfo;
title("videodan alinmis frame görüntüsü");

figure
imshow(nesneler);
title("nesneler");

%we use medfilt for the clean the noises because of the foreground detector.
temiz_nesneler=medfilt2(nesneler,[5 5]);

figure
imshow(temiz_nesneler);
impixelinfo;
title("gürültüden arındırıldı");

select the moving object like cars with the blob analysis.
Kutu = vision.BlobAnalysis("BoundingBoxOutputPort", true, ...
    "AreaOutputPort", false, "CentroidOutputPort", false, ...
    "MinimumBlobArea", 50);
%"MinimumBlobArea" if you use higher value you can detect closer object. use lower value you can detect far away.
%so you should find the true value with trying differen values.  

object = step(Kutu,temiz_nesneler);

tespit_Edilen_obje = insertShape(frameler, "rectangle", object, "color","red");
%Nesne_sayisi = size(object, 1);
%tespit_Edilen_obje=insertText(tespit_Edilen_obje,[10 10],Nesne_sayisi, "BoxOpacity",1,"FontSize",14);




figure
imshow(tespit_Edilen_obje);
impixelinfo;
title("tespit edilen nesneler");


%we make a while loop with all codes above and making a video.
videolastirma=vision.VideoPlayer("Name", "tespit edilen araclar");
videoPlayer.Position(3:4)=[650-400];
while hasFrame(ana_video)
    frameler=readFrame(ana_video);
    nesneler=step(arac_tespiti, frameler);
    temiz_nesneler=medfilt2(nesneler);
    object = step(Kutu,temiz_nesneler);
    Nesne_sayisi = size(object, 1);
    matris=object;
        for i=1:Nesne_sayisi
            a=matris(i,3);
            b=matris(i,4);
            carpim=a*b;
                if carpim<100 && carpim<6000
                    matris(i,1)=0;
                    matris(i,2)=0;
                    matris(i,3)=0;
                    matris(i,4)=0;
                end
        end
    tespit_Edilen_obje = insertShape(frameler, "rectangle", matris, "color","red");
    %tespit_Edilen_obje = insertShape(frameler, "rectangle", object, "color","red");
    
    sonuc=0;
        for y=1:Nesne_sayisi
            z=object(y,3);
            u=object(y,4);
            carpim2=z*u;
                if carpim2>100 
                    sonuc=sonuc+1;
                end
        end
    
    tespit_Edilen_obje=insertText(tespit_Edilen_obje,[10 10],sonuc, "BoxOpacity",1,"FontSize",14);





%     sonuc2=0;
%         for y=1:Nesne_sayisi
%             p=object(y,3);
%             o=object(y,4);
%             carpim2=p*o;
%                 if carpim2>2000 
%                     sonuc=sonuc+1;
%                 end
%         end
%     
%     tespit_Edilen_obje=insertText(tespit_Edilen_obje,[10 10],sonuc2, "BoxOpacity",1,"FontSize",14);

    step(videolastirma,tespit_Edilen_obje);
end
