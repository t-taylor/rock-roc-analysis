function init = init()

  fid = fopen('results.txt', 'w');

  jl = read_image('','10905 JL BW.gif');
  jl_edge = read_image('','10905 JL Edges.gif');

  am4 = read_image('','43590 AM BW.gif');
  am4_edge = read_image('','43590 AM Edges.gif');

  am9 = read_image('','9343 AM BW.gif');
  am9_edge = read_image('','9343 AM Edges.gif');

  init = test(jl, jl_edge, am4, am4_edge, am9, am9_edge, fid, 'Name\tSensitivity\tSpecificity\tSensitivity\tSpecificity\tSensitivity\tSpecificity\n');

  fclose(fid);

end
