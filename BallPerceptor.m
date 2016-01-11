function resp = BallPerceptor(I,BallSpot,AproximatedRadius)
width = AproximatedRadius * 3;
newI = ObtainWindow(I,BallSpot,width,1);
newBallSpot = [1 + round(width/2), 1 + round(width/2)];

filter = fspecial('disk',1);
newI = imfilter(newI,filter,'replicate');
newI = rgb2gray(newI);
%newbw = im2bw(newI);
newI = edge(newI);
%newI = newI + newbw;

%[N,M,dim] = size(newI);
%newI = RemoveBlack(newI);
%[newN,newM,dim] = size(newI);
%diferencia = [N - newN, M - newM];
%NewBallSpot = [newBallSpot(1) - diferencia(1), newBallSpot(2) - diferencia(2)];

Center = CalculatedCenter(newI,newBallSpot);
change = [Center(1) - newBallSpot(1), Center(2) - newBallSpot(2)];
realCenter = BallSpot;
realCenter(1) = BallSpot(1) + change(1);
realCenter(2) = BallSpot(2) + change(2);

i = 1;
contador = 0;
Radius = AproximatedRadius;
tolerance = Radius/2;

while i < 9
    %Todos los bordes son (y,x)
    bordeAnalisis = ScanLine(newI,Center,i);
    radioAnalisis = DistanceBetweenPoints(bordeAnalisis,Center);
    if RadiusSimilitude(radioAnalisis,Radius,tolerance)
        contador = contador + 1;
    end
    i= i+1;
end

if contador >= 5
    ans = insertShape(I, 'circle', [realCenter(2) realCenter(1) AproximatedRadius], 'LineWidth', 1, 'Color', 'green');
    imshow(ans);
else
    ans = insertShape(I, 'circle', [realCenter(2) realCenter(1) 2], 'LineWidth', 1, 'Color', 'red');
    imshow(ans);
end

end

