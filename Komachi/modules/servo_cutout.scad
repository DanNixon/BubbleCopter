/* For Tower Pro 9g servos */

function ServoCutoutSize() = [11.8, 22.2];
function ServoHoleDiameter() = 3;

module ServoCutout()
{
  square(ServoCutoutSize(), center = true);

  dy = (ServoCutoutSize()[1] + 5) / 2;
  for(y = [-dy, dy])
    translate([0, y])
      circle(d = ServoHoleDiameter(), $fa = 1, $fs = 0.1);
}
