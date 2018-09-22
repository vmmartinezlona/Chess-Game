close all;
clear all;
clc;

% _______________ SOLO AL INICIO

% Para el recorte de la imagen
boardMask = computeMask(img);
[row , col] = size(img);
% Medidas para recortar la imagen para que solo parezca el tablero
[xmin , ymin, width] = BoardImage(boardMask, row, col);

% Dimension de la celda del tablero
cellSize = width / 8;
sizeArray = double(cellSize) * ones(1, 8);

% Nombre de las celdas del tablero
cellNamesMatrix = boardCellNames();

i = 0;
while(i<2)
    if i==0
    positionMatrixInit=Chess('./ImagesChess/chess3.png');
    else
    positionMatrixEnd=Chess('./ImagesChess/chess4.png');
    end
    i=i+1;
end

moveMatrix = zeros(8,8);

for i = 1 : 8
    for j = 1 : 8
        if positionMatrixInit(i, j) == 1 && positionMatrixEnd(i, j) == 0
            moveMatrix(i, j) = -1;
            initMove(1) = i;
            initMove(2) = j;
            % moveMatrix = initMove;
            % initMove = initMove - 1;
        elseif piecesMatrixInitPosition(i, j) == 0 && positionEnd(i, j) == 1
            moveMatrix(i, j) = 1;
            endMove(1) = i;
            endMove(2) = j;
            % moveMatrix = endMove;
            % endMove = endMove + 1;
        end
     end
end

% Escribir en el archivo
cellNamesMatrix()
