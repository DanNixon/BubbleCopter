include <../config.scad>;

module MotorRetentionClip()
{
  difference()
  {
    circle(d=ARM_WIDTH);
    circle(d=MOTOR_DIAMETER);
  }
}

MotorRetentionClip();
