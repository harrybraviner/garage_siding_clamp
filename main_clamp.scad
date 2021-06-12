stepover_thickness = 9.00;
rear_clamp_depth = 12.50;
rear_clamp_thickness = 9.00;
slideover_gap = 58.00;
outer_plate_thickness = 9.00;
siding_thickness = 6.00;
height = 40.00;
bolt_diameter = 5.75;
bolt_position_y = 0.3;
bolt_top_margin = 1.0;
locator_hole_diameter = 4.0;
locator_hole_position_y = 0.1;
eyelet_inner_diameter = 15.00;
eyelet_wall_thickness = 6.00;

eps=0.001;

$fn=20;

module main_clamp_positive() {
    cube([2*stepover_thickness + rear_clamp_depth + slideover_gap, height, outer_plate_thickness]);
    translate([0.0, 0.0, outer_plate_thickness - eps])
        cube([stepover_thickness, height, siding_thickness + 2*eps]);
    translate([0.0, 0.0, outer_plate_thickness + siding_thickness])
        cube([stepover_thickness + rear_clamp_depth, height, rear_clamp_thickness]);
        
        translate([stepover_thickness + rear_clamp_depth + slideover_gap, 0.0, outer_plate_thickness - eps])
            cube([stepover_thickness, height, siding_thickness + rear_clamp_thickness + eps]);
    
    // Eyelet
    translate([2*stepover_thickness + rear_clamp_depth + slideover_gap + 0.5*eyelet_inner_diameter, 0.5*height, 0.0])
    difference() {
        cylinder(d=(eyelet_inner_diameter + 2*eyelet_wall_thickness), h=outer_plate_thickness);
        translate([0.0, 0.0, -eps])
        cylinder(d=eyelet_inner_diameter, h=outer_plate_thickness + 2*eps);
    }
}        
 
module bolt_holes() {
        translate([stepover_thickness + rear_clamp_depth + slideover_gap - eps, 0.0, outer_plate_thickness + siding_thickness + rear_clamp_thickness - 0.5*bolt_diameter - bolt_top_margin])
    rotate([0.0, 90.0, 0.0]) {
        translate([0.0, bolt_position_y*height]) {
            cylinder(d=bolt_diameter, h=stepover_thickness+2*eps);
        }
        
        translate([0.0, (1.0 - bolt_position_y)*height]) {
            cylinder(d=bolt_diameter, h=stepover_thickness+2*eps);
        }
        
       // Locator holes
       translate([0.0, locator_hole_position_y*height]) {
            cylinder(d=locator_hole_diameter, h=stepover_thickness+2*eps);
        }
       translate([0.0, (1.0 - locator_hole_position_y)*height]) {
            cylinder(d=locator_hole_diameter, h=stepover_thickness+2*eps);
        }
    }
}

difference() {
    main_clamp_positive();
    bolt_holes();
}