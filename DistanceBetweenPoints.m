function distance = DistanceBetweenPoints(point1, point2)
x = point1(1) - point2(1);
y = point1(2) - point2(2);

distance = sqrt(x*x + y*y);
end

