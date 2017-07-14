use <SCAD_Lib/ServoHorn.scad>;
use <SCAD_Lib/Utils.scad>;

Matrix2D(3, 2, 14, 25)
  ServoHorn(12, 18, tw=8, td=5, hd=1.5, hn=5, $fn=16);
