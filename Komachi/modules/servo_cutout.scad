/* For Tower Pro 9g servos */

function ServoCutoutSize() = [13.1, 23.1];
function ServoHoleDiameter() = 2;

module ServoCutout()
{
  square(ServoCutoutSize(), center = true);

  dy = (ServoCutoutSize()[1] + 5) / 2;
  for(y = [-dy, dy])
    translate([0, y])
      circle(d = ServoHoleDiameter(), $fa = 1, $fs = 0.1);
}
