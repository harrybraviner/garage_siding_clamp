plate_thickness = 3.00;
height=40.00;
locator_peg_diameter = 3.0;
locator_hole_position_y = 0.1;
locator_peg_height = 9.00;
plate_depth=7.00;
eps=0.001;

$fn=20;

cube([plate_depth, height, plate_thickness]);

translate([0.5*plate_depth, locator_hole_position_y*height, plate_thickness - eps])
    cylinder(d=locator_peg_diameter, h=locator_peg_height + eps);
    
translate([0.5*plate_depth, (1.0 - locator_hole_position_y)*height, plate_thickness - eps])
    cylinder(d=locator_peg_diameter, h=locator_peg_height + eps);