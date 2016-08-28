include <../config.scad>;

module Rudder()
{
  minkowski()
  {
    square(RUDDER_DIMENSIONS - [RUDDER_CORNER_RADIUS, RUDDER_CORNER_RADIUS], center=true);
    circle(r = RUDDER_CORNER_RADIUS);
  }

  translate([-((RUDDER_DIMENSIONS[0] - MATERIAL_THICKNESS) / 2), 0])
  {
    pin_height = RUDDER_DIMENSIONS[1] + (RUDDER_PIVOT_LENGTH * 2);
    square([MATERIAL_THICKNESS, pin_height], center=true);
  }
}

Rudder();
