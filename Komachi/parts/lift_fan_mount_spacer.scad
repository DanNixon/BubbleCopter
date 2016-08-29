include <../config.scad>;
include <../modules/fan_mount_spacer.scad>;

module LiftFanMountSpacer()
{
  FanMountSpacer(LIFT_FAN_DUCT_MOUNT_SPACING, LIFT_FAN_DUCT_MOUNT_SEP_WIDTH);
}

LiftFanMountSpacer();
