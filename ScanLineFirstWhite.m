function resp = ScanLineFirstWhite(I,InitialPosition,direction)

firstWhite = [1,1]; %Y,X
Y = InitialPosition(1);
X = InitialPosition(2);
[N,M,dim] = size(I);

if direction == 1 %Hacia abajo
    while Y < N
        while X < M
            if I(Y,X) == 1
                firstWhite = [Y,X];
                break
            else
                X = X + 1;
            end
        end
        if firstWhite(1) ~= 1
            break
        else
            X = InitialPosition(2);
            Y = Y + 1;
        end
    end
end

if direction == 2 %Hacia arriba
    while 0 < Y
        while 0 < X
            if I(Y,X) == 1
                firstWhite = [Y,X];
                break
            else
                X = X - 1;
            end
        end
        if firstWhite(1) ~= 1
            break
        else
            X = InitialPosition(2);
            Y = Y - 1;
        end
    end
end

if direction == 3 %Hacia derecha
    while X < M
        while Y < N
            if I(Y,X) == 1
                firstWhite = [Y,X];
                break
            else
                Y = Y + 1;
            end
        end
        if firstWhite(1) ~= 1
            break
        else
            Y = InitialPosition(1);
            X = X + 1;
        end
    end
end

if direction == 4 %Hacia derecha
    while X < M
        while X < N
            if I(Y,X) == 1
                firstWhite = [Y,X];
                break
            else
                Y = Y + 1;
            end
        end
        if firstWhite(1) ~= 1
            break
        else
            Y = InitialPosition(1);
            X = X - 1;
        end
    end
end

resp = firstWhite;

end

