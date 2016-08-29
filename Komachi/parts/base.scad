include <../config.scad>;
use <../modules/fan_duct_mount.scad>;

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
      FanDuctMount(LIFT_FAN_DUCT_DIMENSIONS[0], LIFT_FAN_DUCT_MOUNT_SEP_WIDTH);

    for(x = THRUST_FAN_DUCT_MOUNT_TAB_POSITIONS)
      for(y = [THRUST_FAN_DUCT_MOUNT_POSITION[1], THRUST_FAN_DUCT_MOUNT_POSITION[1] - THRUST_FAN_DUCT_MOUNT_SPACING - MATERIAL_THICKNESS])
        translate([x, y])
          square([THRUST_FAN_DUCT_MOUNT_TAB_WIDTH + MACHINE_TOLERANCE, MATERIAL_THICKNESS + MACHINE_TOLERANCE], center = true);
  }
}

Base();
