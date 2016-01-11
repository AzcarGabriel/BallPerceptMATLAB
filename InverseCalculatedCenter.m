function resp = InverseCalculatedCenter(I,BallSpot)
%%Insershape (X,Y)
%%BallSpot (Y,X)

bordeDerecho = ScanLine(I,BallSpot,1); %%(Y,X)
bordeIzquierdo = ScanLine(I,BallSpot,2);%%(Y,X)

newX = round((bordeDerecho(2) + bordeIzquierdo(2))/2);
newBallSpot = [bordeDerecho(1), newX];

bordeSuperior = ScanLine(I,newBallSpot,3);%%(Y,X)
bordeInferior = ScanLine(I,newBallSpot,4);%%(Y,X)

newY = round(((bordeSuperior(1) + bordeInferior(1))/2));
calculatedCenter = [newY,newX];

resp = calculatedCenter; %(Y,X)

end


