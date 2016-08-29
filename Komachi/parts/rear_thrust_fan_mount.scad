include <../config.scad>;
include <../modules/fan_duct_mount.scad>;

module RearThrustFanMount()
{
  module Plate()
  {
    module BottomEdge()
    {
      translate([0, -(THRUST_FAN_DUCT_HEIGHT - CORNER/2)])
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
    FanDuctMount(THRUST_FAN_DUCT_DIMENSIONS[0], THRUST_FAN_DUCT_MOUNT_SEP_WIDTH);
  }
}

RearThrustFanMount();
