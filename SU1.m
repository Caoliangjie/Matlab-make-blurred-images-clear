cd('F:\�����γ�\�Ӿ�������\�Ӿ���������ҵ��\');

clear;
SE1 = [0,1;0,1];
SE2 = [1,1;1,1];
BW1=imread('1.jpg');
figure(1),
subplot(2,2,1);imshow(BW1);title('ԭͼ��');
BW11=rgb2gray(BW1);
BW2=edge(BW11,'roberts',0.18,'both');
subplot(2,2,2);imshow(BW2);title('��Ե������ͼ��roberts���ӣ�');
BW3=imerode(BW2,SE1); 
subplot(2,2,3);imshow(BW3);title('��ʴͼ��');
BW4=imdilate(BW3,SE2); 
subplot(2,2,4);imshow(BW4);title('����ͼ��');


clear;
img=imread('2.bmp'); 
f=rgb2gray(img);
figure(2),
subplot(1,2,1);
imshow(f); title('ԭͼ�񣨸�˹ģ����');
f=double(f);  
f=fft2(f);  
f=fftshift(f);  
[m,n]=size(f);  %  
d0=20;  
m1=fix(m/2);  
n1=fix(n/2);  
for i=1:m  
    for j=1:n  
        d=sqrt((i-m1)^2+(j-n1)^2);  
        h(i,j)=exp(-d^2/2/d0^2);  
    end  
end  
g=f.*h;  
g=ifftshift(g);  
g=ifft2(g);  
g=mat2gray(real(g));  
subplot(1,2,2);  
imshow(g);title('ȥģ��ͼ�񣨸�˹ƽ���˲���');
imwrite(img,'2.jpg');


img= imread('3.bmp');
I = rgb2gray(img);
K = medfilt2(I);%���ö�ά��ֵ�˲�����medfilt2���ܽ����������ŵ�ͼ���˲� 
figure(3),
subplot(1,2,1);imshow(I);
title('ԭͼ�񣨽���������');
subplot(1,2,2);imshow(K);
title('ȥģ��ͼ����ֵ�˲���');



clear
rgb=imread('4.bmp');
% ��RGBÿ��ͨ������histeq����
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);
R=histeq(r);
G=histeq(g);
B=histeq(b);
result_rgb=cat(3,R,G,B);
% �����ʾ
figure(4),
subplot(1,2,1),imshow(rgb),title('ԭͼ����')
subplot(1,2,2),imshow(result_rgb),title('ȥģ��ͼ��histeq:ֱ��ͼ���⻯����')


H=imread('5.bmp');%��ȡͼ�񡡡���
I=rgb2gray(H);%����ɫͼ��ת��Ϊ�Ҷ�ͼ��
figure(5),
subplot(2,2,1);
imshow(I);%��ʾͼ�񡡡�
title('ԭͼ����ͼ����ǿ��');
subplot(2,2,3);
imhist(I);%����ͼ��ĻҶ�ֱ��ͼ������
title('ԭͼ�ĻҶ�ֱ��ͼ');
axis('auto');
subplot(2,2,2);
J=histeq(I,64);%��ͼ����о��⻯����������64���Ҷȵ�ͼ��J������
imshow(J);%��ʾͼ�񡡡���
title('ȥģ��ͼ��ֱ��ͼ���⻯��');
subplot(2,2,4);
imhist(J);%����ͼ��ĻҶ�ֱ��ͼ����
title('�����ĻҶ�ֱ��ͼ');


Image=imread('6.jpg');  
[M,N,nDims]=size(Image);
Image=im2double(Image);% ��ȡͼ��ĳߴ�Ͳ�����
ImageStretch=Image;
for i=1:nDims  % ��ÿ���������ν��лҶ�����
    Sp=Image(:,:,i);
    MaxDN=max(max(Sp));
    MinDN=min(min(Sp));
    Sp=(Sp-MinDN)/(MaxDN-MinDN);  % �Ҷ����칫ʽ
    ImageStretch(:,:,i)=Sp;
end
figure(6),
subplot(1,2,1),imshow(Image);title('ԭͼ����Աȶ����죩');
subplot(1,2,2),imshow(ImageStretch);title('ȥģ��ͼ�񣨻Ҷ����죩');


I = im2double(imread('7.tif'));
figure(7),
subplot(1,2,1),imshow(I);
title('ԭͼ���˶�ģ����');
LEN = 8;
THETA = 0;
PSF = fspecial('motion', LEN, THETA);
wnr1 = deconvwnr(I, PSF, 0);
subplot(1,2,2),imshow(wnr1);
title('ȥģ��ͼ��ά���˲���')


