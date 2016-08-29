include <../config.scad>;

module FanMountSpacer(dist, width, tab_width)
{
  square([width, dist], center=true);
  square([width * SPACER_TAB_WIDTH_FACTOR, dist + (2 * MATERIAL_THICKNESS)], center=true);
}
