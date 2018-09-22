function [ OutMatrix ] = boardCellNames(matrix)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    for i = 1 : 8
        for j = 1 : 8
            aux = strcat(char(64 + i), char(48 + j));
            if matrix(i,j) == 1
                OutMatrix{i, j} = char(aux);
            else
                OutMatrix{i,j}=char(' ');
            end
        end
    end
end

