include <../components.scad>

module RXRetentionPlate()
{
  difference()
  {
    minkowski()
    {
      hull()
        RX_MountingHoles();

      circle(d=10);
    }

    RX_MountingHoles();
  }
}

RXRetentionPlate();
