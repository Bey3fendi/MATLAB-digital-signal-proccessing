[data,fs]= audioread("ses_furkan_ozdemir.wav");
[data2,fs2]= audioread("ses_halit_ermis.wav");
[data3,fs3]= audioread("ses_yusuf_akpinar.wav");

%With this command, we listen to the audio file that we read to matlab and make sure that it is transferred to matlab.
  
sound(data,fs)
%We draw our voices in the time-amplitude domain with the following commands
t=linspace(0,length(data)/fs,length(data)); %time vector defined
figure;
plot(t,data);
title("ses1 time domain")
xlabel("t")
ylabel("genlik")

t=linspace(0,length(data2)/fs2,length(data2)); %time vector defined
figure;
plot(t,data2);
title("ses2 time domain")
xlabel("t")
ylabel("genlik")

t=linspace(0,length(data3)/fs3,length(data3)); %time vector defined
figure;
plot(t,data3);
title("ses3 time domain")
xlabel("t")
ylabel("genlik")

%all graphs are drawed.


%now we will collect the three audio files and plot the new graph
%We will make the matrix sizes equal in three voices by adding zeros matrices to make them additive.
eklenecek=zeros(20480,2);
newdata2=[data2;eklenecek];
newdata3=[data3;eklenecek];
toplamdata=data+newdata2+newdata3;
sound(toplamdata,fs)

t=linspace(0,length(toplamdata)/fs3,length(toplamdata)); %time vector defined
figure;
plot(t,toplamdata);
title("toplamses time domain")
xlabel("t")
ylabel("genlik")

%recording of newly created collected audio file
sound(toplamdata,fs)
filename="top_ses.mp4";
audiowrite(filename,toplamdata,fs)


%times compression of the sound by dividing the sampling frequency of the sound by 3
fs4=fs/3;
sound(toplamdata,fs4)

t=linspace(0,length(toplamdata)/fs4,length(toplamdata)); %time vector defined
figure;
plot(t,toplamdata);
title("toplamses time domain")
xlabel("t")
ylabel("genlik")

%generating a sine wave
f=5000; %hertz
 x=sin(2*pi*f*t); figure; plot(t,x);

%now we will draw all the waves produced so far from the time domain to the frequency domain.
N=158719;
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(data));
figure
plot(f,abs(z))


N=138239;
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(data2));
figure
plot(f,abs(z))


N=138239;
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(data3));
figure
plot(f,abs(z))


N=158719;
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(toplamdata));
figure
plot(f,abs(z))


%collecting our first sound file with sin wave and using the transpose process for it
TransposeSin=x.';
y=zeros(158719,1);
TransposeSin=[TransposeSin(:),y(:)];
Toplamdatasin=TransposeSin+data;

t=linspace(0,length(Toplamdatasin)/fs,length(Toplamdatasin));
figure;
plot(t,Toplamdatasin);
title("toplamdatasin time domain")
xlabel("t")
ylabel("genlik")
%frekans domeninde çizelim;
N=158719;
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(Toplamdatasin));
figure
plot(f,abs(z))


[data4,fs5]= audioread("gürültülü_ses_furkan_özdemir.wav");
N=200104;
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(data4));
figure
plot(f,abs(z))

t=linspace(0,length(data4)/fs5,length(data4));
figure;
plot(t,data4);
title("gürültülü data time domain")
xlabel("t")
ylabel("genlik")
