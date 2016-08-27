include <../config.scad>;

module RearFanMountBrace()
{
  module Plate()
  {
    hull()
    {
      translate([THRUST_FAN_DUCT_MOUNT_BRACE_LENGTH - CORNER, 0])
        circle(d = CORNER);

      circle(d = CORNER);

      translate([0, THRUST_FAN_DUCT_HEIGHT - CORNER])
        circle(d = CORNER);
    }
  }

  Plate();
}

RearFanMountBrace();
