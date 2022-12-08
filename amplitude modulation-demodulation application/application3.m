% a
[data,fs]= audioread("music.wav");
sound(data,fs)

%  fs=22050;
%  data=[1;2;3;4;5;6;7;8] %gözlem datası


%fs=22050 bizim örnekleme frekansımızdır. bunu okutma sonucunda tespit
%ettik.

% b
time=length(data)/fs; %sonucu müziğin 30 saniye oldugunu keşfettik


% c=?????
% t=1/fs:1/fs:100;

% d
 t=1/fs:1/fs:time;
% 
 x=sin(2*pi*15000*t);

%Transpose with for loop
[m,n]=size(x);
B=zeros(n,m);
for i=1:m
    for u=1:n
        B(u,i)=x(i,u);
    end
end

%Created a new matrix with dot multiplication
newmatrix=B.*data;

%As a result of these processes, the amplitude modulation of the sound is completed. the audio file should be inaudible as it is. let's test this now
sound(newmatrix,fs)

%Let's start the demodulation process by multiplying the sound with the same sine expression.
G=newmatrix.*B;

%let's listen to the sound again
sound(G,fs)

%we modulated it to transmit the sound more clearly on the bus. 
%Afterwards, we applied the demodulation process since we wanted to send the audio data to be transmitted to the user. 
%As a result, data transmission became possible, but there was a slight loss of data as well as voice.
