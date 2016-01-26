use <Suwako/BoltAndTabBox.scad>
include <../config.scad>
include <../components.scad>

module FrontPanel()
{
  difference()
  {
    YZPanel2D(box_config);
    DisplayCutout();
  }
}

FrontPanel();
