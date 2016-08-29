include <../config.scad>;
include <../modules/fan_duct_mount.scad>;

module RearThrustFanMount()
{
  module Plate()
  {
    module BottomEdge()
    {
      translate([0, -(THRUST_FAN_DUCT_HEIGHT - (CORNER / 2))])
      {
        half_width = (THRUST_FAN_DUCT_MOUNT_WIDTH / 2) - CORNER;

        translate([-half_width, 0])
          circle(d = CORNER);

        translate([half_width, 0])
          circle(d = CORNER);
      }
    }

    intersection()
    {
      hull()
      {
        circle(d = THRUST_FAN_DUCT_DIMENSIONS[0] + THRUST_FAN_DUCT_MOUNT_PADDING);
        BottomEdge();
      }

      hull()
      {
        BottomEdge();
        translate([0, THRUST_FAN_DUCT_HEIGHT * 5])
          BottomEdge();
      }
    }
  }

  difference()
  {
    Plate();

    union()
    {
      FanDuctMount(THRUST_FAN_DUCT_DIMENSIONS[0], THRUST_FAN_DUCT_MOUNT_SEP_WIDTH);

      for(x = [-RUDDER_MOUNT_TAB_OFFSET, RUDDER_MOUNT_TAB_OFFSET])
        for(y = [-RUDDER_MOUNT_OFFSET, RUDDER_MOUNT_OFFSET])
          translate([x, y])
            square([RUDDER_MOUNT_TAB_WIDTH + MACHINE_TOLERANCE, MATERIAL_THICKNESS + MACHINE_TOLERANCE], center = true);
    }
  }
}

RearThrustFanMount();
