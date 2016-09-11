/* Machine */
MACHINE_TOLERANCE = 0.05;

/* Material */
MATERIAL_THICKNESS = 3;
HALF_MATERIAL_THICKNESS = MATERIAL_THICKNESS / 2;

/* Flight control board */
FC_DIMENSIONS = [20, 34, 5]; // 5mm maximum height at JST connectors
FC_POSITION = [0, 0];

/* Motors */
MOTOR_DIAMETER = 8.5;

MOTOR_DIST_X = 37.5;
MOTOR_DIST_Y = 37.5;

MOTOR_POSITIONS = [
  [MOTOR_DIST_X, MOTOR_DIST_Y],
  [-MOTOR_DIST_X, MOTOR_DIST_Y],
  [MOTOR_DIST_X, -MOTOR_DIST_Y],
  [-MOTOR_DIST_X, -MOTOR_DIST_Y]
];

/* Arm motor wiring holes */
WIRING_HOLE_OFFSET = 0.7;
WIRING_HOLE_DIAMETER = 2;

/* Frame */
ARM_WIDTH = 13.5;
PLATE_DIMENSIONS = [30, 45];

/* Fixings/cutouts */
ZIP_TIE_HOLE_DIAM = 3;

/* FPV camera */
FPV_CAMERA_ANGLE = 25;
