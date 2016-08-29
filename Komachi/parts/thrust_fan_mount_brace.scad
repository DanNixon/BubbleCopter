include <../config.scad>;

module ThrustFanMountBrace()
{
  module Plate()
  {
    translate([HALF_CORNER, HALF_CORNER])
    {
      hull()
      {
        translate([THRUST_FAN_DUCT_MOUNT_BRACE_DIM[0] - CORNER, 0])
          circle(d = CORNER);

        circle(d = CORNER);

        translate([0, THRUST_FAN_DUCT_MOUNT_BRACE_DIM[1] - CORNER])
          circle(d = CORNER);
      }
    }
  }

  union()
  {
    Plate();

    translate([-HALF_MATERIAL_THICKNESS + 0.1, THRUST_FAN_DUCT_MOUNT_BRACE_TOP_TAB_POS])
      square([MATERIAL_THICKNESS, THRUST_FAN_DUCT_MOUNT_BRACE_TOP_TAB_WIDTH], center = true);

    translate([THRUST_FAN_DUCT_MOUNT_BRACE_BOTTOM_TAB_POS, -HALF_MATERIAL_THICKNESS + 0.1])
      square([THRUST_FAN_DUCT_MOUNT_BRACE_BOTTOM_TAB_WIDTH, MATERIAL_THICKNESS], center = true);
  }
}

ThrustFanMountBrace();
