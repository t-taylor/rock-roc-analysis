function f = roberts(image)
  load('roberts.mat');

  i_x = conv2(image, robx, 'same');
  i_y = conv2(image, roby, 'same');
  i_x2 = i_x.*i_x;
  i_y2 = i_y.*i_y;
  f = i_x2 + i_y2;
  f = f.^0.5;
end
