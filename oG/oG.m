function f = oG(image, mat_size, sd)

  for i = 1:1:mat_size
    nor(i) = normal(0, sd, i - ceil(mat_size / 2));
  end

  gauss = nor' * nor;

  G_image = conv2(image, gauss, 'same');

  f = G_image;
end
