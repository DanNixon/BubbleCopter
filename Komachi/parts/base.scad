include <../config.scad>;
use <../modules/fan_duct_mount.scad>;
use <../modules/base_plate.scad>;
use <../modules/skirt_clamp_assembly_holes.scad>;

module Base()
{
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
    BasePlate();

    union()
    {
      SkirtClampAssemblyHoles();
      SkirtClampAssemblyHoles(LOWER_SKIRT_MOUNT_SCALE);

      translate(LIFT_FAN_DUCT_POSITION)
        FanDuctMount(LIFT_FAN_DUCT_DIMENSIONS[0], LIFT_FAN_DUCT_MOUNT_SEP_WIDTH);

      for(y = [THRUST_FAN_DUCT_MOUNT_POSITION[1], THRUST_FAN_DUCT_MOUNT_POSITION[1] - THRUST_FAN_DUCT_MOUNT_SPACING - MATERIAL_THICKNESS])
      {
        ThrustFanAssemblyTabs(y);
        BraceAssemlyTabs(y);
      }
    }
  }
}

Base();
