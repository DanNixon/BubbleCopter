include <../config.scad>;

module SkirtTab()
{
  square([SKIRT_TABS_MOUNT_WIDTH, LOWER_SKIRT_MOUNT_SPACING], center=true);
  square([SKIRT_TABS_WIDTH, LOWER_SKIRT_MOUNT_SPACING + (MATERIAL_THICKNESS * 2)], center=true);
}

SkirtTab();
