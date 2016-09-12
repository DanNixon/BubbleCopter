include <config.scad>;

use <Suwako/parts/EachineEF01_FPVCamera.scad>;

use <parts/frame_base.scad>;
use <parts/motor_retention_clip.scad>;
use <parts/fpv_camera_mount.scad>;

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height=MATERIAL_THICKNESS, center=true)
      children();
}

module FCBoard()
{
  color("green")
    cube(FC_DIMENSIONS, center=true);
}

module Motor()
{
  color("silver")
    cylinder(d=MOTOR_DIMENSIONS[0], h=MOTOR_DIMENSIONS[1], $fn=64);

  translate([0, 0, MOTOR_DIMENSIONS[1]])
  {
    hub_height = 5;

    color("grey")
      cylinder(d=3, h=hub_height, $fn=64);

    translate([0, 0, hub_height / 2])
      color([0.9, 0.9, 0.9, 0.2])
        cylinder(d=PROP_DIAMETER, h=1, center=true, $fn=64);
  }
}

module FPVCamera()
{
  rotate([0, -90, -90])
    EachineEF01_FPVCamera();
}


/* Main frame plate */
ExtrudeAndColour("lightgrey")
  FrameBase();

/* Flight controller board */
translate([0, 0, (MATERIAL_THICKNESS + FC_DIMENSIONS[2]) / 2])
  translate(FC_POSITION)
    FCBoard();

/* FPV camera */
translate(FPV_CAMERA_POSITON)
  rotate([FPV_CAMERA_ANGLE, 0, 0])
    FPVCamera();

/* FPV camera mounts */
for(x=[-CAMERA_BRACKET_SPACING / 2, CAMERA_BRACKET_SPACING / 2])
  translate([x, 0, HALF_MATERIAL_THICKNESS])
    rotate([90, 0, -90])
      ExtrudeAndColour("red")
        FPVCameraMount();

/* Motors and retention mounts */
for(p=MOTOR_POSITIONS)
{
  translate(p)
  {
    translate([0, 0, MATERIAL_THICKNESS])
      ExtrudeAndColour("blue")
        MotorRetentionClip();

    translate([0, 0, -HALF_MATERIAL_THICKNESS])
      Motor();
  }
}
