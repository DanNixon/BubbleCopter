include <config.scad>;

use <modules/fan_mount_spacer.scad>;

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

module FanMountSpacerAssembly(duct_diam, sep_len, sep_width)
{
  offset = (duct_diam + sep_width) / 2;

  translate([0, -(sep_len + MATERIAL_THICKNESS) / 2, 0])
    for(a = [0 : 90 : 360])
      rotate([0, a, 0])
        translate([offset, 0, 0])
          ExtrudeAndColour("limegreen")
            FanMountSpacer(sep_len, sep_width);
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
  rotate([270, 0, 0])
    FanMountSpacerAssembly(LIFT_FAN_DUCT_DIMENSIONS[0], LIFT_FAN_DUCT_MOUNT_SPACING, LIFT_FAN_DUCT_MOUNT_SEP_WIDTH);

translate(LIFT_FAN_DUCT_POSITION)
  translate([0, 0, LIFT_FAN_DUCT_MOUNT_SPACING + MATERIAL_THICKNESS])
    ExtrudeAndColour("cyan")
      LiftFanTopMount();

translate(THRUST_FAN_DUCT_MOUNT_POSITION)
{
  ThrustFanMountAssembly();

  translate([0, 0, THRUST_FAN_DUCT_HEIGHT + HALF_MATERIAL_THICKNESS])
    FanMountSpacerAssembly(THRUST_FAN_DUCT_DIMENSIONS[0], THRUST_FAN_DUCT_MOUNT_SPACING, THRUST_FAN_DUCT_MOUNT_SEP_WIDTH);

  translate([0, -(THRUST_FAN_DUCT_MOUNT_SPACING + MATERIAL_THICKNESS), 0])
  {
    ThrustFanMountAssembly();
    translate([0, 0, THRUST_FAN_DUCT_HEIGHT + HALF_MATERIAL_THICKNESS])
      RudderAssembly();
  }
}
