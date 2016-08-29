include <../config.scad>;

module ThrustFanDuctMountPlate()
{
  module BottomEdge()
  {
    translate([0, -(THRUST_FAN_DUCT_HEIGHT - (CORNER / 2))])
    {
      half_width = (THRUST_FAN_DUCT_MOUNT_WIDTH / 2) - CORNER;

      translate([-half_width, 0])
        circle(d = CORNER);

      translate([half_width, 0])
        circle(d = CORNER);
    }
  }

  intersection()
  {
    hull()
    {
      circle(d = THRUST_FAN_DUCT_DIMENSIONS[0] + THRUST_FAN_DUCT_MOUNT_PADDING);
      BottomEdge();
    }

    hull()
    {
      BottomEdge();
      translate([0, THRUST_FAN_DUCT_HEIGHT * 5])
        BottomEdge();
    }
  }

  for(x = THRUST_FAN_DUCT_MOUNT_TAB_POSITIONS)
    translate([x, -THRUST_FAN_DUCT_HEIGHT - HALF_MATERIAL_THICKNESS + 0.1])
      square([THRUST_FAN_DUCT_MOUNT_TAB_WIDTH, MATERIAL_THICKNESS], center = true);
}
