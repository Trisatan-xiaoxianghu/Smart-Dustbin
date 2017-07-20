clear all;
clc

%Train Models
%test
%imTest  = imread('image\\FantaTest.jpg');
%imTest  = imread('image\\Fanta2.jpg');
%imTest  = imread('image\\FantaNoBrand.jpg');
%imTest  = imread('image\\ColaZero2.jpg');
%imTest  = imread('image\\Beer.jpg');
%imTest  = imread('image\\Bottle.jpg');
imTest  = imread('image\\Empty.jpg');
imTest = imresize(imTest,[50,50]);
imTestGRAY   = double(rgb2gray(imTest));%ת��Ϊ�Ҷ�ͼ��
[imRow,imCol] = size(imTestGRAY);
%��Matrix���Vector
for k = 1:imRow
    imTestVector((1+imCol*(k-1)):(imCol*k)) = imTestGRAY(k,1:imCol);
end
%threshold = graythresh(imGRAY);%��ֵ
%imBinary = im2bw(imGRAY, threshold);%ת��Ϊ��ֵͼ��
%[imRow,imCol] = size(imBinary);

%i=1;
%imTest01  = imread(strcat('image\\im',num2str(i,'%04d'),'.jpg'));

%test Fanta
NumberOfFantaTrainCases = 3;
for i = 1:NumberOfFantaTrainCases
    imTrainCase  = imread(strcat('image\\imFanta',num2str(i,'%02d'),'.jpg'));
    imTrainCase = imresize(imTrainCase,[50,50]);
    imTrainGRAY   = double(rgb2gray(imTrainCase));%ת��Ϊ�Ҷ�ͼ��
    [imRow,imCol] = size(imTrainGRAY);
    error = imTestGRAY-imTrainGRAY;
    %��Matrix���Vector
    for k = 1:imRow
        imTrainVector((1+imCol*(k-1)):(imCol*k)) = imTrainGRAY(k,1:imCol);
    end
    %imDelta = zscore(imTrainVector-imTestVector);
    distance =0;
    for ii=1:(imRow*imCol)
        distance=distance+(imTrainVector(ii)-imTestVector(ii)).^2;
    end
    outputFanta(i) = sqrt(distance);
    %outputFanta(i) =pdist(imDelta,'Euclid')%����ŷ�Ͼ���
end
outputFanta;
FantaRelativity = min(outputFanta)

%test ColaZero
NumberOfColaZeroTrainCases = 3;
for i = 1:NumberOfColaZeroTrainCases
    imTrainCase  = imread(strcat('image\\imColaZero',num2str(i,'%02d'),'.jpg'));
    imTrainCase = imresize(imTrainCase,[50,50]);
    imTrainGRAY   = double(rgb2gray(imTrainCase));%ת��Ϊ�Ҷ�ͼ��
    [imRow,imCol] = size(imTrainGRAY);
    error = imTestGRAY-imTrainGRAY;
    %��Matrix���Vector
    for k = 1:imRow
        imTrainVector((1+imCol*(k-1)):(imCol*k)) = imTrainGRAY(k,1:imCol);
    end
    %imDelta = zscore(imTrainVector-imTestVector);
    distance =0;
    for ii=1:(imRow*imCol)
        distance=distance+(imTrainVector(ii)-imTestVector(ii)).^2;
    end
    outputColaZero(i) = sqrt(distance);
    %outputColaZero(i) =pdist(imDelta,'Euclid')%����ŷ�Ͼ���
end
outputColaZero;
ColaZeroRelativity = min(outputColaZero)

%test Beer
NumberOfBeerTrainCases = 3;
for i = 1:NumberOfBeerTrainCases
    imTrainCase  = imread(strcat('image\\imBeer',num2str(i,'%02d'),'.jpg'));
    imTrainCase = imresize(imTrainCase,[50,50]);
    imTrainGRAY   = double(rgb2gray(imTrainCase));%ת��Ϊ�Ҷ�ͼ��
    [imRow,imCol] = size(imTrainGRAY);
    error = imTestGRAY-imTrainGRAY;
    %��Matrix���Vector
    for k = 1:imRow
        imTrainVector((1+imCol*(k-1)):(imCol*k)) = imTrainGRAY(k,1:imCol);
    end
    %imDelta = zscore(imTrainVector-imTestVector);
    distance =0;
    for ii=1:(imRow*imCol)
        distance=distance+(imTrainVector(ii)-imTestVector(ii)).^2;
    end
    outputBeer(i) = sqrt(distance);
    %outputBeer(i) =pdist(imDelta,'Euclid')%����ŷ�Ͼ���
end
outputBeer;
BeerRelativity = min(outputBeer)


    
   