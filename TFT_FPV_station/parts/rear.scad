use <Suwako/BoltAndTabBox.scad>
include <../config.scad>
include <../components.scad>

module RearPanel()
{
  difference()
  {
    YZPanel2D(box_config);

    DisplayMountingHoles();

    translate([0, 35])
    {
      RX();
      RX_MountingHoles();
    }
  }
}

RearPanel();
