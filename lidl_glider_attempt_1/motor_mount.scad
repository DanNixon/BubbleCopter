use <SCAD_Lib/Utils.scad>;

module MotorMount(size, sd, mc, md, cr=5)
{
  $fn=32;

  cd = cr * 2;

  difference()
  {
    // Bracket body
    minkowski()
    {
      square(size - [cd, cd], center=true);
      circle(r=cr);
    }

    // Shaft clearance
    circle(d=sd);

    // Mounting holes
    for(a=[45:90:360])
      rotate([0, 0, a])
        translate([mc / 2, 0])
        circle(d=md);
  }
}

Matrix2D(1, 3, 0, 22)
  MotorMount([35, 20], 6, 12, 2.1);
