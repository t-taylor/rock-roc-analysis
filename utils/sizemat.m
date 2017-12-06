function f = sizemat(lh, image)

  imsize = size(image);

  minl = (imsize(1) - lh(1)) / 2;
  maxl = ceil(lh(1) + minl);
  minl = ceil(minl + 1);
  minh = (imsize(2) - lh(2)) / 2;
  maxh = ceil(lh(2) + minh);
  minh = ceil(minh + 1);

  f = image(minl:maxl, minh:maxh);
end
