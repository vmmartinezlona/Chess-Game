function [positionMatrix] = Chess(nameImage, cropMask, sizeArray)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    % isFirstTime=0;

    % Convertir a escala de grises
    img = rgb2gray(nameImage);
    % boardMask = computeMask(img);
    %[row , col] = size(img);

    % Recortar la imagen para que solo parezca el tablero
    % [xmin , ymin, width] = BoardImage(boardMask, row, col);
    % boardImg = imcrop(img,[xmin ymin width-1 width-1]);
    boardImg = imcrop(img, cropMask)

    figure, imshow(boardImg), title('Final');

    %Calculamos los bordes de Canny. El valor depende del ambiente
    imgEdges = edge(boardImg,'Canny', 0.2); % ____________________________________________________ Cambiar dependiendo del ambiente
    figure, imshow(imgEdges), title('Canny');


    %_________ Esto se calcula una sola vez, es la dimension de la celda
    % cellSize = width / 8;
    % sizeArray = double(cellSize) * ones(1, 8);
    % isFirstTime = 1;


    %Aplicamos un filtro para limpiar la imagen
    h = fspecial('sobel');
    imgEdges = imfilter(imgEdges,h);
    % Dividir el tablero en celda
    chessBoard = mat2cell(imgEdges, sizeArray, sizeArray);
    figure, imshow(chessBoard{1,8}), title('chess');

    cellSize - sizeArray(1);
    % Reconocer si hay o no pieza
    cannyValues  = CannyValues(chessBoard, cellSize*cellSize);
    cannyValues

    % Guardamos una matriz con 1 si hay pieza, el valor del umbral depende del ambiente
    positionMatrix  = PositionMatrix(cannyValues, 0.057);

    positionMatrix

end
