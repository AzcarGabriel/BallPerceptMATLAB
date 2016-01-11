function newI = RemoveBlack(I)

%De arriba hacia abajo
[N,M,dim] = size(I);
uno = ScanLineFirstWhite(I,[1,1],1); % Y,X
if uno(1) > 1
    newI = Window(I,[uno(1) - 1,1,N,M]);
else
    newI = I;
end

%De abajo hacia arriba
[N,M,dim] = size(newI);
dos = ScanLineFirstWhite(newI,[N,M],2);
if dos(1) + 1 < N
    newI = Window(newI,[1,1,dos(1)+1,M]); %YInicial, XInicial, YFinal, Xfinal
end

%De derecha a izquierda
[N,M,dim] = size(newI);
tres = ScanLineFirstWhite(newI,[1,1],3);
if tres(2) - 2 > 0
    newI = Window(newI,[1,tres(2) - 1,N,M]);
end

%De izquierda a derecha
[N,M,dim] = size(newI);
cuatro = ScanLineFirstWhite(newI,[1,M],4);
if cuatro(2) - 2 > 0
    newI = Window(newI,[1,1,N,cuatro(2) + 1]);
end

end

