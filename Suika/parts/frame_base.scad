include <../config.scad>;

module FrameBase()
{
  module Plate()
  {
    square(PLATE_DIMENSIONS, center=true);
  }

  module MotorCross()
  {
    for(p=MOTOR_POSITIONS)
    {
      hull()
      {
        circle(d=ARM_WIDTH);

        translate(p)
          circle(d=ARM_WIDTH);
      }
    }
  }

  module MotorMountingHoles()
  {
    for(p=MOTOR_POSITIONS)
    {
      /* Motor cutout */
      translate(p)
        circle(d=MOTOR_DIMENSIONS[0]);

      /* Motor wire holes */
      translate(p * WIRING_HOLE_OFFSET)
        circle(d=WIRING_HOLE_DIAMETER);
    }
  }

  module FCRetentionHoles()
  {
    translate(FC_POSITION)
    {
      offset = (FC_DIMENSIONS[0] / 2) + 1;
      for(x = [-offset, offset])
        translate([x, 0, 0])
          translate(FC_RETENTION_OFFSET)
            circle(d=ZIP_TIE_HOLE_DIAM, $fn=16);
    }
  }

  module FPVCameraMountHoles()
  {
    dx = (CAMERA_BRACKET_SPACING + MATERIAL_THICKNESS) / 2;
    dy = CAMERA_BRACKET_TAB_OFFSET + (CAMERA_BRACKET_TAB_WIDTH / 2);

    for(x = [-dx, dx])
      for(y = [-dy, dy])
        translate([x, y])
          square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, CAMERA_BRACKET_TAB_WIDTH + MACHINE_TOLERANCE], center=true);
  }

  difference()
  {
    union()
    {
      Plate();
      MotorCross();
    }

    union()
    {
      MotorMountingHoles();
      FCRetentionHoles();
      FPVCameraMountHoles();
    }
  }
}

FrameBase();
