function [ cannyValues ] = CannyValues( chessBoard, width )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

cannyValues  = zeros(8,8);

for i = 1 : 8
    for j = 1 : 8
        cannyValues(i, j) = sum(sum(double(chessBoard{i, j})))/double(width);
    end   
end

end

