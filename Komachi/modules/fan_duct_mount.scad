module FanDuctMount(duct_diam)
{
  duct_rad = duct_diam / 2;

  circle(d = duct_diam);

  /* TODO */
  for(a = [0: 90: 360])
    rotate([0, 0, a])
      translate([0, duct_rad + 10])
        square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, 5], center=true);
}
