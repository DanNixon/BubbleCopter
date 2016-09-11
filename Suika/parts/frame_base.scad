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
      translate(p)
        circle(d=MOTOR_DIAMETER);

      translate(p * WIRING_HOLE_OFFSET)
        circle(d=WIRING_HOLE_DIAMETER);
    }
  }

  module Cutouts()
  {
    /* TODO: FC zipties */
    /* TODO: camera mounts */
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
      Cutouts();
    }
  }
}

FrameBase();
