include <config.scad>;

use <parts/base.scad>
use <parts/rear_fan_mount.scad>
use <parts/rear_fan_mount_brace.scad>

$fn = 16;

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height = MATERIAL_THICKNESS, center = true)
      children();
}

ExtrudeAndColour("blue")
  Base();

translate([0, 0, THRUST_FAN_DUCT_HEIGHT + HALF_MATERIAL_THICKNESS])
{
  translate(THRUST_FAN_DUCT_MOUNT_POSITION)
  {
    rotate([90, 0, 0])
      ExtrudeAndColour("red")
        RearFanMount();

    translate([0, -THRUST_FAN_DUCT_MOUNT_SPACING, 0])
      rotate([90, 0, 0])
        ExtrudeAndColour("red")
          RearFanMount();
  }
}
