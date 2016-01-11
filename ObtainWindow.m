function window = ObtainWindow(I,BallSpot,width,binario)
InitialPosition = [BallSpot(1) - round(width/2), BallSpot(2) - round(width/2)]; %Y,X
y = InitialPosition(1);
x = InitialPosition(2);
i = 1;
j = 1;

if binario == 2
    window = zeros(width,width);
else
    window = uint8(zeros(width,width,3));
end

while i <= width
    while j <= width
        if binario == 2
            window(j,i) = I(y,x);
            j = j + 1;
            y = y + 1;
        else
            window(j,i,1) = I(y,x,1);
            window(j,i,2) = I(y,x,2);
            window(j,i,3) = I(y,x,3);
            j = j + 1;
            y = y + 1;
        end
    end
    j = 1;
    y = InitialPosition(1);
    i = i + 1;
    x = x + 1;
end
end