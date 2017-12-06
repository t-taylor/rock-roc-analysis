function f = laptobool(image)
  sig = sign(image);
  f = laplc(sig);
  f = gt(f, 0);
end
