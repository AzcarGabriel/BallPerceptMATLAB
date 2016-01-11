function resp = CalculatedCenter(I,BallSpot)
%%Insershape (X,Y)
%%BallSpot (Y,X)
bordeSuperior = ScanLine(I,BallSpot,4); %%(Y,X)
bordeInferior = ScanLine(I,BallSpot,3);%%(Y,X)

if bordeSuperior(1) == 0 || bordeInferior(1) == 0
    resp = InverseCalculatedCenter(I,BallSpot);
else
    newY = round((bordeInferior(1) + bordeSuperior(1))/2);
    newBallSpot = [newY, bordeInferior(2)];
    
    bordeDerecho = ScanLine(I,newBallSpot,1);%%(Y,X)
    bordeIzquierdo = ScanLine(I,newBallSpot,2);%%(Y,X)
    
    newX = round(((bordeDerecho(2) + bordeIzquierdo(2))/2));
    calculatedCenter = [newY,newX];
    
    resp = calculatedCenter; %(Y,X)
end
end

