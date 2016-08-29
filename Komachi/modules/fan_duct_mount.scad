module FanDuctMount(duct_diam, sep_width)
{
  circle(d = duct_diam);

  offset = (duct_diam + sep_width) / 2;
  for(a = [0: 90: 360])
    rotate([0, 0, a])
      translate([0, offset])
        square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, sep_width * SPACER_TAB_WIDTH_FACTOR + MACHINE_TOLERANCE], center=true);
}
