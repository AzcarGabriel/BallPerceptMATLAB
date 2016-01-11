function value = RadiusValue(I,CalculatedCenter,direction) %Solo para fondo verde, o mayoritariamente verde
% 1 derecha, 2 izquierda, 3 arriba, 4 abajo
% 5 diagonal arriba derecha, 6 diagonal abajo izquierda
% 7 diagonal abajo derecha, 8 diagonal arriba izquierda
% A(2,4) Extract the element in row 2, column 4
Y = CalculatedCenter(1);
X = CalculatedCenter(2);
[N,M,dim] = size(I);
value = 0;
if direction == 1 || direction == 2
    while 0 < X && X < N && ~IsGreen(I,X,Y)
        X = X - ((-1)^direction);
    end
    value = DistanceBetweenPoints([Y,X],CalculatedCenter);
    
elseif direction == 3 || direction == 4
    direction = direction - 2;
    while 0<Y && Y<M && ~IsGreen(I,X,Y) 
        Y = Y + ((-1)^direction);
    end
    value = DistanceBetweenPoints([Y,X],CalculatedCenter);
    
elseif direction == 5 || direction == 6
    direction = direction - 4;
    while 0<Y && Y<M && 0<X && X<N && ~IsGreen(I,X,Y) 
        Y = Y + ((-1)^direction);
        X = X - ((-1)^direction);
    end
    value = DistanceBetweenPoints([Y,X],CalculatedCenter);
    
elseif direction == 7 || direction == 8
    direction = direction - 6;
    while 0<Y && Y<M && 0<X && X<N && ~IsGreen(I,X,Y)
        Y = Y - ((-1)^direction);
        X = X - ((-1)^direction);
    end
    value = DistanceBetweenPoints([Y,X],CalculatedCenter);    
end   
end

