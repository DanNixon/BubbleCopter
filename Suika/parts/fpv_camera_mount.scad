include <../config.scad>;

module FPVCameraMount()
{
  cam_angle_rotate_2d = [
       [cos(FPV_CAMERA_ANGLE), -sin(FPV_CAMERA_ANGLE)],
       [sin(FPV_CAMERA_ANGLE),  cos(FPV_CAMERA_ANGLE)]
      ];

  cam_pos_offset = [-FPV_CAMERA_POSITON[1], FPV_CAMERA_POSITON[2]];

  bracket_points = [
    [-CAMERA_BRACKET_LENGTH / 2, 0],
    [-CAMERA_BRACKET_LENGTH * 0.4, CAMERA_BRACKET_BASE_HEIGHT],
    ([0, -CAMERA_BRACKET_CAM_SPACING] * cam_angle_rotate_2d) + cam_pos_offset,
    ([0, CAMERA_BRACKET_CAM_SPACING] * cam_angle_rotate_2d) + cam_pos_offset,
    [CAMERA_BRACKET_LENGTH * 0.4, CAMERA_BRACKET_BASE_HEIGHT],
    [CAMERA_BRACKET_LENGTH / 2, 0]
  ];

  echo("Camera bracket points", bracket_points);

  difference()
  {
    minkowski()
    {
      circle(r=1, $fn=32);

      offset(r=-1)
        polygon(points=bracket_points);
    }

    scale(0.6)
      polygon(points=bracket_points, paths=[[0, 1, 4, 5, 0]]);
  }
}

FPVCameraMount();
