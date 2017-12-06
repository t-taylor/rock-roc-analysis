function f = sobelXY(image)
  load('sobel.mat');

  i_x = conv2(image, sobelX, 'same');
  i_y = conv2(image, sobelY, 'same');
  i_x2 = i_x.*i_x;
  i_y2 = i_y.*i_y;
  f = sqrt(i_x2 + i_y2);
end
