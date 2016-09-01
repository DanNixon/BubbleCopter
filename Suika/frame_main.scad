MOTOR_DIST_X = 37.5;
MOTOR_DIST_Y = 37.5;
MOTOR_DIAMETER = 8.5;

WIRING_HOLE_OFFSET = 0.7;
WIRING_HOLE_DIAMETER = 2;

ARM_WIDTH = 13.5;
PLATE_DIMENSIONS = [30, 45];

ZIP_TIE_HOLE_OFFSETS = [0.15, 0.4, 0.6, 0.85];
ZIP_TIE_HOLE_DIAM = 3;


module MainPlate()
{
  motor_positions = [
    [MOTOR_DIST_X, MOTOR_DIST_Y],
    [-MOTOR_DIST_X, MOTOR_DIST_Y],
    [MOTOR_DIST_X, -MOTOR_DIST_Y],
    [-MOTOR_DIST_X, -MOTOR_DIST_Y]
  ];

  module Plate()
  {
    square(PLATE_DIMENSIONS, center=true);
  }

  module MotorCross()
  {
    for(p=motor_positions)
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
    for(p=motor_positions)
    {
      translate(p)
        circle(d=MOTOR_DIAMETER);

      translate(p * WIRING_HOLE_OFFSET)
        circle(d=WIRING_HOLE_DIAMETER);
    }
  }

  module Cutouts()
  {
    half_dim = PLATE_DIMENSIONS / 2;
    translate(-half_dim)
    {
      for(i=ZIP_TIE_HOLE_OFFSETS)
      {
        translate([PLATE_DIMENSIONS[0] * 0.85, PLATE_DIMENSIONS[1] * i])
          circle(d=ZIP_TIE_HOLE_DIAM);
        translate([PLATE_DIMENSIONS[0] * 0.15, PLATE_DIMENSIONS[1] * i])
          circle(d=ZIP_TIE_HOLE_DIAM);
      }
    }
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


module MotorRetentionClips()
{
  difference()
  {
    circle(d=ARM_WIDTH);
    circle(d=MOTOR_DIAMETER);
  }
}


$fs = 2;

MainPlate();

for(a = [0 : 90 : 360])
  rotate([0, 0, a])
    translate([0, (max(PLATE_DIMENSIONS) / 2) + ARM_WIDTH])
      MotorRetentionClips();
