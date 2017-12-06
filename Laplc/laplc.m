function f = laplc(image)
  load('laplacian.mat');
  lap_image = conv2(image, laplacian,'same');
  f = lap_image;
end
