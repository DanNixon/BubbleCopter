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

module ThrustFanMountAssembly()
{
  translate([0, 0, THRUST_FAN_DUCT_HEIGHT + HALF_MATERIAL_THICKNESS])
    rotate([90, 0, 0])
      ExtrudeAndColour("red")
        RearFanMount();

  translate([0, HALF_MATERIAL_THICKNESS, 0])
  {
    half_width = THRUST_FAN_DUCT_MOUNT_BRACE_SPACING / 2;

    translate([-half_width, 0, 0])
      rotate([90, 0, 90])
        ExtrudeAndColour("green")
          RearFanMountBrace();

    translate([half_width, 0, 0])
      rotate([90, 0, 90])
        ExtrudeAndColour("green")
          RearFanMountBrace();
  }
}


ExtrudeAndColour("blue")
  Base();

translate(THRUST_FAN_DUCT_MOUNT_POSITION)
{
  ThrustFanMountAssembly();

  translate([0, -THRUST_FAN_DUCT_MOUNT_SPACING, 0])
    ThrustFanMountAssembly();
}
