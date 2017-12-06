function normal = normal(mean,sd,x)
  normal = 1 / (sqrt(2 * pi * (sd ^ 2))) * (exp(- ((x - mean) ^ 2) / (2 * (sd ^ 2))));
end
