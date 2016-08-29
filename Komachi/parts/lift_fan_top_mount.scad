include <../config.scad>;
include <../modules/fan_duct_mount.scad>;

module LiftFanTopMount()
{
  difference()
  {
    circle(d = LIFT_FAN_DUCT_DIMENSIONS[0] + 30);
    FanDuctMount(LIFT_FAN_DUCT_DIMENSIONS[0], LIFT_FAN_DUCT_MOUNT_SEP_WIDTH);
  }
}

LiftFanTopMount();
