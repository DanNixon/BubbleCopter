include <../config.scad>;
use <../modules/fan_duct_mount.scad>;
use <../modules/thrust_fan_duct_mount_plate.scad>;

module FrontThrustFanMount()
{
  difference()
  {
    ThrustFanDuctMountPlate();
    FanDuctMount(THRUST_FAN_DUCT_DIMENSIONS[0], THRUST_FAN_DUCT_MOUNT_SEP_WIDTH);
  }
}

FrontThrustFanMount();
