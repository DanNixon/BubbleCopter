include <../config.scad>;

module SkirtClampAssemblyHoles(scale_factor = 1)
{
  dims = BASE_DIMENSIONS * scale_factor;

  module Hole(p)
  {
    translate(p)
      circle(d = SKIRT_CLAMP_HOLE_DIAM);
  }

  dx = (dims[0] - SKIRT_CLAMP_PADDING) / 2;
  half_width = dims[1] / 2;
  for(x = [-dx, dx])
    for(y = [half_width - (BASE_FRONT_CORNER_RADIUS * scale_factor), -(half_width - (BASE_REAR_CORNER_RADIUS * scale_factor))])
      Hole([x, y]);

  dy = (dims[1] - SKIRT_CLAMP_PADDING) / 2;
  for(y = [-dy, dy])
    Hole([0, y]);
}
