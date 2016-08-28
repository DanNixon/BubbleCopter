include <config.scad>;

use <parts/base.scad>
use <parts/rear_fan_mount.scad>
use <parts/rear_fan_mount_brace.scad>
use <parts/lift_fan_top_mount.scad>
use <parts/rudder.scad>
use <parts/rudder_mount.scad>

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

    for(x = [-half_width, half_width])
      translate([x, 0, 0])
        rotate([90, 0, 90])
          ExtrudeAndColour("green")
            RearFanMountBrace();
  }
}

module RudderAssembly()
{
  rudder_offset = RUDDER_SPACING / 2;
  rudder_assy_offset = -(RUDDER_DIMENSIONS[0] + RUDDER_MOUNT_DIMENSIONS[1] - MATERIAL_THICKNESS) / 2;

  translate([0, -HALF_MATERIAL_THICKNESS, 0])
  {
    for(z = [-RUDDER_MOUNT_OFFSET, RUDDER_MOUNT_OFFSET])
      translate([0, 0, z])
        rotate([0, 0, 180])
          ExtrudeAndColour("orange")
            RudderMount();

    translate([0, rudder_assy_offset, 0])
      for(x = [-rudder_offset, rudder_offset])
        translate([x, 0, 0])
          rotate([90, 0, 270])
            ExtrudeAndColour("magenta")
              Rudder();
  }
}


ExtrudeAndColour("blue")
  Base();

translate(LIFT_FAN_DUCT_POSITION)
  translate([0, 0, 20])
    ExtrudeAndColour("cyan")
      LiftFanTopMount();

translate(THRUST_FAN_DUCT_MOUNT_POSITION)
{
  ThrustFanMountAssembly();

  translate([0, -THRUST_FAN_DUCT_MOUNT_SPACING, 0])
  {
    ThrustFanMountAssembly();

    translate([0, 0, THRUST_FAN_DUCT_HEIGHT + HALF_MATERIAL_THICKNESS])
      RudderAssembly();
  }
}