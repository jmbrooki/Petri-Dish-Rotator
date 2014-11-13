// Combination of 3 pieces for Scientific project

include <base.scad>
include <Petri_dish_spinner_plate001.scad>
include <DC Motor box.scad>

color("Blue")base();

color("aqua")translate([-0.5*case_width,-0.6*case_depth,.93*h_arm])case_holed();

color("powderblue")translate([0,-1.5*case_depth,1.01*h_arm])rotate(90,[1,0,0])plate();