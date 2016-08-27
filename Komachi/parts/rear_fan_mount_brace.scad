include <../config.scad>;

module RearFanMountBrace()
{
  module Plate()
  {
    hull()
    {
      circle(d = CORNER);

      translate([THRUST_FAN_DUCT_MOUNT_BRACE_LENGTH - CORNER, 0])
      {
        circle(d = CORNER);

        translate([0, THRUST_FAN_DUCT_HEIGHT - CORNER])
          circle(d = CORNER);
      }
    }
  }

  Plate();
}

RearFanMountBrace();
