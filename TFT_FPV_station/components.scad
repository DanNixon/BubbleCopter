use <Suwako/DXFImport.scad>

display_dxf = "../Kanako/Displays/eBay_7inch_TFT.dxf";

module DisplayCutout()
{
  projection()
    DXFImport(display_dxf, subtraction_layers=["TFT_Cutout"]);
}

module DisplayMountingHoles()
{
  projection()
    DXFImport(display_dxf, subtraction_layers=["TFT_MountingHoles"]);
}
