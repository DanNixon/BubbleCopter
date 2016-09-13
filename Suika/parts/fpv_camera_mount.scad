include <../config.scad>;

module FPVCameraMount()
{
  cam_angle_rotate_2d = [
       [cos(FPV_CAMERA_ANGLE), -sin(FPV_CAMERA_ANGLE)],
       [sin(FPV_CAMERA_ANGLE),  cos(FPV_CAMERA_ANGLE)]
      ];

  fpv_cam_pos_2d = [-FPV_CAMERA_POSITON[1], FPV_CAMERA_POSITON[2]];

  bracket_points = [
    [-CAMERA_BRACKET_TAB_OFFSET - CAMERA_BRACKET_TAB_WIDTH, 0],
    [-CAMERA_BRACKET_TAB_OFFSET - CAMERA_BRACKET_TAB_WIDTH, -MATERIAL_THICKNESS],
    [-CAMERA_BRACKET_TAB_OFFSET, -MATERIAL_THICKNESS],
    [-CAMERA_BRACKET_TAB_OFFSET, 0],
    [-CAMERA_BRACKET_LENGTH * 0.5, 0],
    [-CAMERA_BRACKET_LENGTH * 0.4, CAMERA_BRACKET_BASE_HEIGHT],
    ([0, CAMERA_BRACKET_LOW_CAM_POS] * cam_angle_rotate_2d) + fpv_cam_pos_2d,
    ([0, CAMERA_BRACKET_HIGH_CAM_POS] * cam_angle_rotate_2d) + fpv_cam_pos_2d,
    [CAMERA_BRACKET_LENGTH * 0.4, CAMERA_BRACKET_BASE_HEIGHT],
    [CAMERA_BRACKET_LENGTH * 0.5, 0],
    [CAMERA_BRACKET_TAB_OFFSET, 0],
    [CAMERA_BRACKET_TAB_OFFSET, -MATERIAL_THICKNESS],
    [CAMERA_BRACKET_TAB_OFFSET + CAMERA_BRACKET_TAB_WIDTH, -MATERIAL_THICKNESS],
    [CAMERA_BRACKET_TAB_OFFSET + CAMERA_BRACKET_TAB_WIDTH, 0],
  ];

  echo("Camera bracket points", bracket_points);

  difference()
  {
    union()
    {
      translate([0, 0.01])
        polygon(points=bracket_points, paths=[[0, 1, 2, 3, 10, 11, 12, 13]]);

      minkowski()
      {
        circle(r=1, $fn=32);

        offset(r=-1)
          polygon(points=bracket_points, paths=[[4, 5, 6, 7, 8, 9]]);
      }
    }

    union()
    {
      scale(0.6)
        polygon(points=bracket_points, paths=[[4, 5, 8, 9, 10]]);

      /* Mounting solts for FPV camera back panel */
      translate(fpv_cam_pos_2d - [0, HALF_MATERIAL_THICKNESS])
        rotate([0, 0, 90 - FPV_CAMERA_ANGLE])
          translate([0, -CAMERA_BRACKET_PANEL_OFFSET])
            square([CAMERA_BRACKET_PANEL_TAB_WIDTH + MACHINE_TOLERANCE, MATERIAL_THICKNESS + MACHINE_TOLERANCE], center=true);

      /* Hole for access to the set button on the Eachine FPV camera */
      translate(fpv_cam_pos_2d)
        rotate([0, 0, -FPV_CAMERA_ANGLE])
          translate([-1, -7.5])
            circle(d=2, $fn=16);
    }
  }
}

FPVCameraMount();
