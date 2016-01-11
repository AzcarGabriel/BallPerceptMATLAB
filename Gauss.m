X = ObtainWindow(I,BallSpot,AproximatedRadius*3);
imshow(X);
H = fspecial('disk',2);
A = imfilter(window,H,'replicate');
BW = rgb2gray(A);
window = edge(BW);