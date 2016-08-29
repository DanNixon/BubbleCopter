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

  module ThrustFanAssemblyTabs(y)
  {
    for(x = THRUST_FAN_DUCT_MOUNT_TAB_POSITIONS)
      translate([x, y])
        square([THRUST_FAN_DUCT_MOUNT_TAB_WIDTH + MACHINE_TOLERANCE, MATERIAL_THICKNESS + MACHINE_TOLERANCE], center = true);
  }

  module BraceAssemlyTabs(y)
  {
    half_width = THRUST_FAN_DUCT_MOUNT_BRACE_SPACING / 2;

    for(x = [-half_width, half_width])
      translate([x, y + THRUST_FAN_DUCT_MOUNT_BRACE_BOTTOM_TAB_POS + HALF_MATERIAL_THICKNESS])
        square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, THRUST_FAN_DUCT_MOUNT_BRACE_BOTTOM_TAB_WIDTH + MACHINE_TOLERANCE], center = true);
  }

  difference()
  {
    Plate();

    translate(LIFT_FAN_DUCT_POSITION)
      FanDuctMount(LIFT_FAN_DUCT_DIMENSIONS[0], LIFT_FAN_DUCT_MOUNT_SEP_WIDTH);

    for(y = [THRUST_FAN_DUCT_MOUNT_POSITION[1], THRUST_FAN_DUCT_MOUNT_POSITION[1] - THRUST_FAN_DUCT_MOUNT_SPACING - MATERIAL_THICKNESS])
    {
      ThrustFanAssemblyTabs(y);
      BraceAssemlyTabs(y);
    }
  }
}

Base();
