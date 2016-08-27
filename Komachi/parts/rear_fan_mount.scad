include <../config.scad>;

module RearFanMount()
{
  module Plate()
  {
    hull()
    {
      half_width = (THRUST_FAN_DUCT_MOUNT_WIDTH / 2) - CORNER;

      circle(d = THRUST_FAN_DUCT_DIAM + THRUST_FAN_DUCT_MOUNT_PADDING);

      translate([0, -(THRUST_FAN_DUCT_HEIGHT - CORNER/2)])
      {
        translate([-half_width, 0])
          circle(d = CORNER);

        translate([half_width, 0])
          circle(d = CORNER);
      }
    }
  }

  difference()
  {
    Plate();
    circle(d = THRUST_FAN_DUCT_DIAM);
  }
}

RearFanMount();
