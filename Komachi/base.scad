include <./config.scad>;

module Base()
{
  half_dim = BASE_DIMENSIONS / 2;

  hull()
  {
    translate([0, half_dim[1] - BASE_FRONT_CORNER_RADIUS])
    {
      d = half_dim[0] - BASE_FRONT_CORNER_RADIUS;

      translate([-d, 0])
        circle(r=BASE_FRONT_CORNER_RADIUS);

      translate([d, 0])
        circle(r=BASE_FRONT_CORNER_RADIUS);
    }

    translate([0, -half_dim[1] + BASE_REAR_CORNER_RADIUS])
    {
      d = half_dim[0] - BASE_REAR_CORNER_RADIUS;

      translate([-d, 0])
        circle(r=BASE_REAR_CORNER_RADIUS);

      translate([d, 0])
        circle(r=BASE_REAR_CORNER_RADIUS);
    }
  }
}

Base();
