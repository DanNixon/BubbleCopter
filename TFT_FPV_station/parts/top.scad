use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module TopPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    translate([-15, 24])
      circle(d=15);
  }
}

TopPanel();
