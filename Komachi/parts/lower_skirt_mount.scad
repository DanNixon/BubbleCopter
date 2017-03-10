include <../config.scad>;
use <Suwako/Honeycomb.scad>;
use <../modules/fan_duct_mount.scad>;
use <../modules/base_plate.scad>;
use <../modules/skirt_clamp_assembly_holes.scad>;

module LowerSkirtMount()
{
  difference()
  {
    BasePlate(LOWER_SKIRT_MOUNT_SCALE);

    union()
    {
      SkirtClampAssemblyHoles(LOWER_SKIRT_MOUNT_SCALE);

      translate([0, -5])
        Honeycomb(size=[45, 80], cell_size = 4, wall_thickness = 8, center = true);
    }
  }
}

LowerSkirtMount();
