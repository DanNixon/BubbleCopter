include <../config.scad>;

module Rudder()
{
  module RudderMain()
  {
    minkowski()
    {
      square(RUDDER_DIMENSIONS - [RUDDER_CORNER_RADIUS, RUDDER_CORNER_RADIUS], center = true);
      circle(r = RUDDER_CORNER_RADIUS);
    }

    translate([-((RUDDER_DIMENSIONS[0] - MATERIAL_THICKNESS) / 2), 0])
    {
      pin_height = RUDDER_DIMENSIONS[1] + (RUDDER_PIVOT_LENGTH * 2);
      square([RUDDER_MATERIAL_THICKNESS, pin_height], center = true);
    }
  }

  difference()
  {
    RudderMain();

    translate(RUDDER_ARM_HOLE_POSITION)
      circle(d = RUDDER_ARM_HOLE_POSITION);
  }
}

Rudder();
