function f = test(i1, c1, i2, c2, i3, c3, fid, title)

  fprintf(fid, [title]);

  c1 = ne(c1, 0);
  c2 = ne(c2, 0);
  c3 = ne(c3, 0);

  matrix_range = 7;
  sd_range = 3;

  for threshold = 1:0.25:15

    % Roberts

    name = "rob, t = " + threshold;

    rob_i1 = roberts(i1);
    rres_i1 = res(rob_i1 > threshold, c1);
    rob_i2 = roberts(i2);
    rres_i2 = res(rob_i2 > threshold, c2);
    rob_i3 = roberts(i3);
    rres_i3 = res(rob_i3 > threshold, c3);

    fprintf(fid, name + "\t");
    fprintf(fid, '%f\t%f\t', rres_i1(1), rres_i1(2));
    fprintf(fid, '%f\t%f\t', rres_i2(1), rres_i2(2));
    fprintf(fid, '%f\t%f\n', rres_i3(1), rres_i3(2));

    % Sobel

    name = "sob, t = " + threshold;

    sob_i1 = sobelXY(i1);
    sres_i1 = res(sob_i1 < threshold, c1);
    sob_i2 = sobelXY(i2);
    sres_i2 = res(sob_i2 < threshold, c2);
    sob_i3 = sobelXY(i3);
    sres_i3 = res(sob_i3 < threshold, c3);

    fprintf(fid, name + "\t");
    fprintf(fid, '%f\t%f\t', sres_i1(1), sres_i1(2));
    fprintf(fid, '%f\t%f\t', sres_i2(1), sres_i2(2));
    fprintf(fid, '%f\t%f\n', sres_i3(1), sres_i3(2));
      for matsize = 2:matrix_range

        for sd = 0.2:0.2:sd_range

        gaus_i1 = oG(i1, matsize, sd);
        gaus_i2 = oG(i2, matsize, sd);
        gaus_i3 = oG(i3, matsize, sd);

        % Sobel oG

        name = "sog, t = " + threshold + ", ms = " + matsize + ", sd = " + sd;

        SoG_i1 = sobelXY(gaus_i1);
        sogres_i1 = res(SoG_i1 < threshold, c1);
        SoG_i2 = sobelXY(gaus_i2);
        sogres_i2 = res(SoG_i2 < threshold, c2);
        SoG_i3 = sobelXY(gaus_i3);
        sogres_i3 = res(SoG_i3 < threshold, c3);

        fprintf(fid, name + "\t");
        fprintf(fid, '%f\t%f\t', sogres_i1(1), sogres_i1(2));
        fprintf(fid, '%f\t%f\t', sogres_i2(1), sogres_i2(2));
        fprintf(fid, '%f\t%f\n', sogres_i3(1), sogres_i3(2));
      end
    end
  end

  for matsize = 2:matrix_range

    for sd = 0.2:0.2:sd_range

      gaus_i1 = oG(i1, matsize, sd);
      gaus_i2 = oG(i2, matsize, sd);
      gaus_i3 = oG(i3, matsize, sd);

      % Laplacian oG

      name = "log, ms = " + matsize + ", sd = " + sd;

      fprintf(fid, name + "\t");

      LoG_i1 = laptobool(gaus_i1);
      logres_i1 = res(LoG_i1, c1);
      fprintf(fid,'%f\t%f\t', logres_i1(1), logres_i1(2));

      LoG_i2 = laptobool(gaus_i2);
      logres_i2 = res(LoG_i2, c2);
      fprintf(fid,'%f\t%f\t', logres_i2(1), logres_i2(2));

      LoG_i3 = laptobool(gaus_i3);
      logres_i3 = res(LoG_i3, c3);
      fprintf(fid,'%f\t%f\n', logres_i3(1), logres_i3(2));

      for threshold = 0.1:0.05:4
        % Roberts oG

        name = "rog, t = " + threshold + ", ms = " + matsize + ", sd = " + sd;

        RoG_i1 = roberts(gaus_i1);
        rogres_i1 = res(RoG_i1 > threshold, c1);
        RoG_i2 = roberts(gaus_i2);
        rogres_i2 = res(RoG_i2 > threshold, c2);
        RoG_i3 = roberts(gaus_i3);
        rogres_i3 = res(RoG_i3 > threshold, c3);

        fprintf(fid, name + "\t");
        fprintf(fid, '%f\t%f\t', rogres_i1(1), rogres_i1(2));
        fprintf(fid, '%f\t%f\t', rogres_i2(1), rogres_i2(2));
        fprintf(fid, '%f\t%f\n', rogres_i3(1), rogres_i3(2));

      end
    end

  % Laplacian

  name = "lap";
  lap_i1 = laptobool(i1);
  lres_i1 = res(lap_i1, c1);
  lap_i2 = laptobool(i2);
  lres_i2 = res(lap_i2, c2);
  lap_i3 = laptobool(i3);
  lres_i3 = res(lap_i3, c3);

  fprintf(fid, name + "\t");
  fprintf(fid, '%f\t%f\t', lres_i1(1), lres_i1(2));
  fprintf(fid, '%f\t%f\t', lres_i2(1), lres_i2(2));
  fprintf(fid, '%f\t%f\n', lres_i3(1), lres_i3(2));

  for matsize = 2:matrix_range

    for sd = 0.2:0.2:sd_range

      gaus_i1 = oG(i1, matsize, sd);
      gaus_i2 = oG(i2, matsize, sd);
      gaus_i3 = oG(i3, matsize, sd);


    end
  end

  f = [];
end

