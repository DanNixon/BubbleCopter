include <../config.scad>;

module FPVCameraMountPlate()
{
  square([CAMERA_BRACKET_SPACING, CAMERA_BRACKET_PANEL_HEIGHT], center=true);

  hull()
  {
    dx = (CAMERA_BRACKET_SPACING + MATERIAL_THICKNESS) /2;
    for(x = [-dx, dx])
      translate([x, 0])
        square([MATERIAL_THICKNESS, CAMERA_BRACKET_PANEL_TAB_WIDTH], center=true);
  }
}

FPVCameraMountPlate();
