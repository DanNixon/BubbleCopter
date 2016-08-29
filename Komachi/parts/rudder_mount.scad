include <../config.scad>;

module RudderMount()
{
  module Plate()
  {
    sq_dims = RUDDER_MOUNT_DIMENSIONS - [0, RUDDER_CORNER_RADIUS * 2];

    translate([0, sq_dims[1] / 2])
    {
      hull()
      {
        square(sq_dims, center=true);

        delta = RUDDER_MOUNT_DIMENSIONS[0] / 2 - RUDDER_MOUNT_CORNER_RADIUS;
        for(x = [-delta, delta])
          translate([x, (RUDDER_MOUNT_DIMENSIONS[1] - RUDDER_MOUNT_CORNER_RADIUS) / 2])
            circle(r = RUDDER_MOUNT_CORNER_RADIUS);
      }
    }
  }

  module MountingTabs()
  {
    for(x = [-RUDDER_MOUNT_TAB_OFFSET, RUDDER_MOUNT_TAB_OFFSET])
      translate([x, -HALF_MATERIAL_THICKNESS])
        square([RUDDER_MOUNT_TAB_WIDTH, MATERIAL_THICKNESS], center=true);
  }

  difference()
  {
    union()
    {
      Plate();
      MountingTabs();
    }

    offset = RUDDER_SPACING / 2;
    for(x = [-offset, offset])
      translate([x, (RUDDER_MOUNT_DIMENSIONS[1] / 2)])
        circle(d = sqrt(2 * pow(MATERIAL_THICKNESS, 2)) + MACHINE_TOLERANCE);
  }
}

RudderMount();
