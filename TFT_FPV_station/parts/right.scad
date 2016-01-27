use <Suwako/BoltAndTabBox.scad>
use <Suwako/Label.scad>
include <../config.scad>

module RightPanel()
{
  difference()
  {
    XZPanel2D(box_config);

    translate([0, -50])
      Label("Power 12V DC", size=4)
        circle(d=8);

    translate([0, -10])
      Label("AV2 in", size=4)
        circle(d=6.5);

    translate([0, 20])
      Label("RX video out", size=4)
        circle(d=6.5);
  }
}

RightPanel();
