function resp = Window(I,vertices)
%Vertices = [YInicial, XInicial, YFinal, Xfinal]
verticeInicial = [vertices(1),vertices(2)]; %Y,X
newSize = [vertices(4) - vertices(2), vertices(3) - vertices(1)]; %Y,X
i = 1; j = 1;
x = verticeInicial(2);
y = verticeInicial(1);
resp = zeros(newSize(2),newSize(1));
[N,M,dim] = size(I);

while i <= newSize(1) && x <= M
    while j <= newSize(2) && y<=N
        resp(j,i) = I(y,x);
        j = j + 1;
        y = y + 1;
    end
    j = 1;
    y = verticeInicial(1);
    i = i + 1;
    x = x + 1;
end
end


