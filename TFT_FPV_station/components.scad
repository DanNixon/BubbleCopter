use <Suwako/DXFImport.scad>

display_dxf = "../Kanako/Displays/eBay_7inch_TFT.dxf";
rx_dxf = "../Kanako/Modules/RC832_5.8ghz_video_RX.dxf";

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

module RX()
{
  projection()
    DXFImport(rx_dxf, subtraction_layers=["RX_Cutouts"]);
}
