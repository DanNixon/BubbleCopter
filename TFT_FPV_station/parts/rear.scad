use <Suwako/BoltAndTabBox.scad>
include <../config.scad>
include <../components.scad>

module RearPanel()
{
  difference()
  {
    YZPanel2D(box_config);
    DisplayMountingHoles();
  }
}

RearPanel();
