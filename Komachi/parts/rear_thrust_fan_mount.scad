include <../config.scad>;
use <../modules/fan_duct_mount.scad>;
use <../modules/thrust_fan_duct_mount_plate.scad>;

module RearThrustFanMount()
{
  difference()
  {
    ThrustFanDuctMountPlate();

    union()
    {
      FanDuctMount(THRUST_FAN_DUCT_DIMENSIONS[0], THRUST_FAN_DUCT_MOUNT_SEP_WIDTH);

      for(x = [-RUDDER_MOUNT_TAB_OFFSET, RUDDER_MOUNT_TAB_OFFSET])
        for(y = [-RUDDER_MOUNT_OFFSET, RUDDER_MOUNT_OFFSET])
          translate([x, y])
            square([RUDDER_MOUNT_TAB_WIDTH + MACHINE_TOLERANCE, RUDDER_MATERIAL_THICKNESS + MACHINE_TOLERANCE], center = true);
    }
  }
}

RearThrustFanMount();
