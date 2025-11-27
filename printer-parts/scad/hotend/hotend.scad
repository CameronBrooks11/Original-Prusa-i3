e3d_v6_heatsink($fs=0.25, $fa=0.1);

// total_length = 42.75

module e3d_v6_heatsink() {
  alum = [0.9, 0.9, 0.9];
  fin = 0.87;
  gap = 1.63;

  x0 = 4 / 2;
  x1 = 8 / 2;
  x2 = 16 / 2;
  x3 = 12 / 2;
  x4 = 22 / 2;
  x5 = 6 / 2;

  y1 = -4;
  y2 = -10;
  y3 = -12.75;

  // 6mm depth of top hole before narrow
  color(alum) rotate_extrude(convexity=13) polygon(
        [
          [x0, -6],
          [x1, -6],
          [x1, 0],
          [x2, 0],
          [x2, y1],
          [x3, y1],
          [x3, y2],
          [x2, y2],
          [x2, y3],
          [x3, y3],
          [x3, y3 - 1 * gap],
          [x2, y3 - 1 * gap],
          [x2, y3 - 1 * gap - 1 * fin],
          [x3, y3 - 1 * gap - 1 * fin],
          [x3, y3 - 2 * gap - 1 * fin],
          [x4, y3 - 2 * gap - 1 * fin],
          [x4, y3 - 2 * gap - 2 * fin],
          [x3, y3 - 2 * gap - 2 * fin],
          [x3, y3 - 3 * gap - 2 * fin],
          [x4, y3 - 3 * gap - 2 * fin],
          [x4, y3 - 3 * gap - 3 * fin],
          [x3, y3 - 3 * gap - 3 * fin],
          [x3, y3 - 4 * gap - 3 * fin],
          [x4, y3 - 4 * gap - 3 * fin],
          [x4, y3 - 4 * gap - 4 * fin],
          [x3, y3 - 4 * gap - 4 * fin],
          [x3, y3 - 5 * gap - 4 * fin],
          [x4, y3 - 5 * gap - 4 * fin],
          [x4, y3 - 5 * gap - 5 * fin],
          [x3, y3 - 5 * gap - 5 * fin],
          [x3, y3 - 6 * gap - 5 * fin],
          [x4, y3 - 6 * gap - 5 * fin],
          [x4, y3 - 6 * gap - 6 * fin],
          [x3, y3 - 6 * gap - 6 * fin],
          [x3, y3 - 7 * gap - 6 * fin],
          [x4, y3 - 7 * gap - 6 * fin],
          [x4, y3 - 7 * gap - 7 * fin],
          [x3, y3 - 7 * gap - 7 * fin],
          [x3, y3 - 8 * gap - 7 * fin],
          [x4, y3 - 8 * gap - 7 * fin],
          [x4, y3 - 8 * gap - 8 * fin],
          [x3, y3 - 8 * gap - 8 * fin],
          [x3, y3 - 9 * gap - 8 * fin],
          [x4, y3 - 9 * gap - 8 * fin],
          [x4, y3 - 9 * gap - 9 * fin],
          [x3, y3 - 9 * gap - 9 * fin],
          [x3, y3 - 10 * gap - 9 * fin],
          [x4, y3 - 10 * gap - 9 * fin],
          [x4, y3 - 10 * gap - 10 * fin],
          [x3, y3 - 10 * gap - 10 * fin],
          [x3, y3 - 11 * gap - 10 * fin],
          [x4, y3 - 11 * gap - 10 * fin],
          [x4, y3 - 11 * gap - 11 * fin],
          [x3, y3 - 11 * gap - 11 * fin],
          [x3, y3 - 12 * gap - 11 * fin],
          [x4, y3 - 12 * gap - 11 * fin],
          [x4, y3 - 12 * gap - 12 * fin],
          [x5, y3 - 12 * gap - 12 * fin],
          [x5, y3 - 12 * gap - 12 * fin + 14.8],
          [x0, y3 - 12 * gap - 12 * fin + 14.8],
        ]
      );
}
