include <../config.scad>;
use <../modules/fan_duct_mount.scad>;
use <../modules/base_plate.scad>;
use <../modules/skirt_clamp_assembly_holes.scad>;

module LowerSkirtMountClamp()
{
  difference()
  {
    BasePlate(LOWER_SKIRT_MOUNT_SCALE);

    union()
    {
      offset(r = -SKIRT_CLAMP_PADDING)
        BasePlate(LOWER_SKIRT_MOUNT_SCALE);

      SkirtClampAssemblyHoles(LOWER_SKIRT_MOUNT_SCALE);
    }
  }
}

LowerSkirtMountClamp();
