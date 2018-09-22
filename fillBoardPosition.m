function [ matrix ] = fillBoardPosition( matrix, x1, x2, y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    piece = matrix(2, 8) + 1;

    for i = x1 : x2
        for j = 1 : y
            matrix(i, j) = piece;
            piece = piece + 1;        
        end
    end
end

