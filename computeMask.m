function [ BWfinal ] = computeMask( img )
% Calcula la mascara que segmentara nuestro tablero

[~, threshold] = edge(img, 'sobel');
fudgeFactor = .5;
BWs = edge(img,'sobel', threshold * fudgeFactor);
% figure(1), imshow(BWs), title('binary gradient mask');

se90 = strel('line', 4, 90);
se0 = strel('line', 4, 0);
BWsdil = imdilate(BWs, [se90 se0]);
% figure, imshow(BWsdil), title('dilated gradient mask');
 
BWdfill = imfill(BWsdil, 'holes');
%figure, imshow(BWdfill), title('binary image with filled holes');
 
BWnobord = imclearborder(BWdfill, 4);
% figure, imshow(BWnobord), title('cleared border image');
 
se = strel('line', 30, 90);
BWfinal = imerode(BWnobord, se);
figure, imshow(BWfinal), title(' image');
    
end

