originPic=imread('/Users/yuzheng/Documents/Results/flow_field_HU.png');
GrayPic1=rgb2gray(originPic);
GrayPic2=imbinarize(GrayPic1,0.185);

%bw=imcomplement(GrayPic2);
%bw=uint8(bw);
%GrayPic=bw.*GrayPic1;
%GrayPic2=imbinarize(GrayPic2);
GrayPic=double(GrayPic2);
phi=mean(GrayPic(:));
GrayPic=GrayPic-phi;


FGrayPic=fft2(GrayPic);
FGrayPic=fftshift(FGrayPic);
MFGrayPic=abs(FGrayPic);
MFGrayPic=MFGrayPic.^2;

FlattenedData = MFGrayPic(:)'; 
MappedFlattened = mapminmax(FlattenedData, 0, 255); 
MappedData = reshape(MappedFlattened, size(MFGrayPic)); 

sk=zeros(422500,2);
n=1;c=1;r=1;
for i=1:1:650
    for j=1:1:650
        sk(n,1)=sqrt((i-325)^2+(j-325)^2);
        sk(n,2)=MappedData(i,j);
        n=n+1;
    end
end
func=sortrows(sk,1);
B=tabulate(func(:,1));
[row,col]=size(func);
[rowb,colb]=size(B);
final=zeros(rowb,2);
while c<row+1
    d=B(r,2);
    final(r,:)=(sum(func(c:(c+d-1),:),1))/d;
    c=c+d;
    r=r+1;
end
finals=final';
x(1,:)=finals(1,:);
y(1,:)=finals(2,:);

figure;
scatter(x,y,'k');
xlabel('k');
ylabel('S(k)');

%image(originPic);
figure;
imshow(MappedData);
figure;
imshow(GrayPic2);

