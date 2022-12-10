%The purpose of this application is to perform the convulation operation with the algorithm established in matlab without the conv command. 
%Our application starts with receiving the two matrices to be convoluted from the user.
n=1; 
m=input("sutun: ");

for i=1:n
    for j=1:m
        matrix(i,j)=input("sayı giriniz: ");

    end
end


z=1; 
x=input("sutun: ");

for i=1:z
    for j=1:x
        matrix2(i,j)=input("sayı giriniz: ");

    end
end

c1=length(matrix);
c2=length(matrix2);

%%Calculation of the length of the new matrix that will be formed as a result of the convolution
N=c1+c2-1;

%they are made to length N by zero padding on two matrices
matrix=[matrix,zeros(1,N-c1)];
matrix2=[matrix2,zeros(1,N-c2)];
%output matrix created
y=zeros(1,N);
%Implementation of convolution operation with for loop
for i=1:N
    for u=1:i
        y(i)=y(i)+matrix(u)*matrix2(i-u+1);
    end
end
