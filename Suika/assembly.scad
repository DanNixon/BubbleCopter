include <config.scad>;

use <Suwako/parts/EachineEF01_FPVCamera.scad>;

use <parts/frame_base.scad>;
use <parts/motor_retention_clip.scad>;

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

module FPVCamera()
{
  rotate([0, -90, -90])
    EachineEF01_FPVCamera();
}


/* Main frame plate */
ExtrudeAndColour("silver")
  FrameBase();

/* Flight controller board */
translate([0, 0, (MATERIAL_THICKNESS + FC_DIMENSIONS[2]) / 2])
  translate(FC_POSITION)
    FCBoard();

/* Motor retention mounts */
translate([0, 0, MATERIAL_THICKNESS])
  ExtrudeAndColour("blue")
    for(p=MOTOR_POSITIONS)
      translate(p)
        MotorRetentionClip();

/* FPV camera */
translate([0, 0, 20]) // TODO
  rotate([FPV_CAMERA_ANGLE, 0, 0])
    FPVCamera();
