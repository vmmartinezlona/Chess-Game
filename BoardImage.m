function [ xmin, ymin , width ] = BoardImage( boardMask , row , col)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

isFirst = 0;
lim = uint64(row/1.5);
% Calcular la posicion de la esquina superior-izquierda
for i = 1 : lim
    if isFirst == 0
        for j = 1 : col
            if boardMask(i, j) == 1
              isFirst = 1;
              upLeft = [j, i]; 
               break
             end
        end
    else
        break
    end
end

isFirst = 0;
% Calcular la posicion de la esquina inferior-derecha
lim = uint64(col/1.5);
%lim
for i = row : -1 : 1
    if isFirst == 0
        for j = col : -1 : lim
            if boardMask(i, j) == 1
                isFirst = 1;
                lowRight = [j, i]; 
                break
            end
        end
    else
        break
    end
end

% Ajuste de la posicon para segurarnos que contiene al tablero
% ______________________________________________________ -1 cambia
% dependiendo del ambiente. Default 7, lR -7
upLeft(1)   = LimitsAdjust(upLeft(1),  -5, row);%col, row);
upLeft(2)   = LimitsAdjust(upLeft(2),  -3, col);%col, row);
lowRight(1) = LimitsAdjust(lowRight(1), -5, row);%col, row);
lowRight(2) = LimitsAdjust(lowRight(1), -30, col);%col, row);
 
%Construir el rectangulo dentro del cual se encuentra nuestro tablero
xmin = upLeft(1);
ymin = upLeft(2);
width  = lowRight(1) - upLeft(1) ;
height = lowRight(2) - upLeft(2) ;
width = (width + height) / 2;

hold on
  plot(upLeft(1),upLeft(2),'ro');
  plot(lowRight(1),lowRight(2),'ro');

width=int16(width);
% Necesitamos asegurar que el tamanio es multiplo de 8
while(mod(width, 8) ~= 0)
    width = width - 1;
end

end

