function [ point ] = pointAdjust( xyCoor , adjust, limit)%width, height)
%Hace un ajuste de las coordenadas, solo para segurarnos que tomamos el
%tablero ponemos un ajuste de 10px

 point = xyCoor(1) + (adjust);
 if point < 0
     point = 0;
 elseif point > limit
     point = limit;
%  if point < 0
%      point = 0;
%  elseif point > width
%       point = width;
% %  elseif point < 0
% %      point = 0;
% %  elseif point > height
% %      point = height;
%  end

end

