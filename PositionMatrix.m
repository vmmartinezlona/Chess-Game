function [ positionMatrix ] = PositionMatrix( cannyValues, minValue )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

positionMatrix  = zeros(8,8);

for i = 1 : 8
    for j = 1 : 8
        if cannyValues(i, j) > minValue
            positionMatrix(i, j) = 1;
        end
    end   
end

end

