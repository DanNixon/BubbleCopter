include <../config.scad>;
use <../modules/fan_duct_mount.scad>;
use <../modules/base_plate.scad>;
use <../modules/skirt_clamp_assembly_holes.scad>;

module BaseSkirtClamp()
{
  difference()
  {
    BasePlate();

    union()
    {
      offset(r = -SKIRT_CLAMP_PADDING)
        BasePlate();

      SkirtClampAssemblyHoles();
    }
  }
}

BaseSkirtClamp();
