include <../config.scad>;

module SkirtClampTabCutoutsTranslation(scale_factor)
{
  dims = BASE_DIMENSIONS * scale_factor;

  dx = (dims[0] - SKIRT_TABS_PADDING) / 2;
  half_width = dims[1] / 2;
  for(x = [-dx, dx])
    for(y = [half_width - (BASE_FRONT_CORNER_RADIUS * scale_factor), -(half_width - (BASE_REAR_CORNER_RADIUS * scale_factor))])
      translate([x, y] + SKIRT_TABS_OFFSET)
        children();
}

module SkirtClampTabCutouts(scale_factor = 1)
{
  if(SKIRT_TABS)
  {
    SkirtClampTabCutoutsTranslation(scale_factor)
      square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, SKIRT_TABS_WIDTH + MACHINE_TOLERANCE], center=true);
  }
}
