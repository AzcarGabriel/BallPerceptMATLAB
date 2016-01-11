function lastWhite = ScanLine(I,InitialPosition,direction) %%fin -> (Y,X)
% 1 derecha, 2 izquierda, 3 arriba, 4 abajo
% 5 diagonal arriba derecha, 6 diagonal abajo izquierda
% 7 diagonal abajo derecha, 8 diagonal arriba izquierda
% A(2,4) Extract the element in row 2, column 4
lastWhite = [0,0];
Y = InitialPosition(1);
X = InitialPosition(2);
[N,M,dim] = size(I);

if direction == 1 || direction == 2 %%derecha e izquierda
    while 0 < X && X <= M
        if I(Y,X) == 1
            lastWhite = [Y,X];
        end
        X = X - ((-1)^direction);
    end
    
elseif direction == 3 || direction == 4 %%arriba y abajo
    direction = direction - 2;
    while 0 < Y && Y<=N
        if I(Y,X) == 1
            lastWhite = [Y,X];
        end
        Y = Y + ((-1)^direction);
    end
    
elseif direction == 5 || direction == 6
    direction = direction - 4;
    while 0<Y && Y<=N && 0<X && X<=M
        if I(Y,X) == 1
            lastWhite = [Y,X];
        end
        Y = Y + ((-1)^direction);
        X = X - ((-1)^direction);
    end
    
elseif direction == 7 || direction == 8
    direction = direction - 6;
    while 0<Y && Y<=N && 0<X && X<=M
        if I(Y,X) == 1
            lastWhite = [Y,X];
        end
        Y = Y - ((-1)^direction);
        X = X - ((-1)^direction);
    end
end

end

