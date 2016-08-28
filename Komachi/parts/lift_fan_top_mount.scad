include <../config.scad>;
include <../modules/fan_duct_mount.scad>;

module LiftFanTopMount()
{
  difference()
  {
    circle(d = LIFT_FAN_DUCT_DIAM + 30);
    FanDuctMount(LIFT_FAN_DUCT_DIAM);
  }
}

LiftFanTopMount();
