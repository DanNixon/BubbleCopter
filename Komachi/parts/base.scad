include <../config.scad>;
include <../modules/fan_duct_mount.scad>;

module Base()
{
  module Plate()
  {
    hull()
    {
      half_dim = BASE_DIMENSIONS / 2;

      translate([0, half_dim[1] - BASE_FRONT_CORNER_RADIUS])
      {
        d = half_dim[0] - BASE_FRONT_CORNER_RADIUS;

        translate([-d, 0])
          circle(r = BASE_FRONT_CORNER_RADIUS);

        translate([d, 0])
          circle(r = BASE_FRONT_CORNER_RADIUS);
      }

      translate([0, -half_dim[1] + BASE_REAR_CORNER_RADIUS])
      {
        d = half_dim[0] - BASE_REAR_CORNER_RADIUS;

        translate([-d, 0])
          circle(r = BASE_REAR_CORNER_RADIUS);

        translate([d, 0])
          circle(r = BASE_REAR_CORNER_RADIUS);
      }
    }
  }

  difference()
  {
    Plate();

    translate(LIFT_FAN_DUCT_POSITION)
      FanDuctMount(LIFT_FAN_DUCT_DIMENSIONS[0]);
  }
}

Base();
