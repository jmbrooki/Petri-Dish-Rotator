//Part:		DC Motor Case
//Desc:		For Petri Dish Specimen Spinner
//Author:	Jim Hingst
//Date:		11/03/2014
//Units:		mm

// variables
wall_thick = 5;
case_width = 60;
case_depth = 27;//this is motor length 12mm plus 5mm front face 
case_height = 45;

//main case
module case() {
union(){
	//bottom plate
	cube([case_width,case_depth,wall_thick]);

	//left face plate
	translate([0,0,wall_thick])cube([wall_thick,case_depth,case_height - wall_thick]);

	//right face plate
	translate([case_width - wall_thick,0,wall_thick])cube([wall_thick,case_depth,case_height - wall_thick]);

	//front plate
	translate([wall_thick,0,wall_thick])cube([case_width - (2*wall_thick),wall_thick,case_height - wall_thick]);
}
}

module case_holed(){
difference(){
case();
//shaft hole
translate([60/2,-1,13])rotate(-90,[1,0,0])cylinder(h=7,r=1.55,$fn=20);
//screw hole right
translate([60/2+5.5,-1,13])rotate(-90,[1,0,0])cylinder(h=7,r=2.19/2,$fn=20);
//screw hole left
translate([60/2-5.5,-1,13])rotate(-90,[1,0,0])cylinder(h=7,r=2.19/2,$fn=20);

//screw head right
translate([60/2+5.5,-.2,13])rotate(-90,[1,0,0])cylinder(h=1.3+.2,r1=4.2/2+.1,r2=2.19/2,$fn=20);
//screw head left
translate([60/2-5.5,-.2,13])rotate(-90,[1,0,0])cylinder(h=1.3+.2,r1=4.2/2+.1,r2=2.19/2,$fn=20);
//arm axle hole
translate([-.5,case_depth-10,case_height-10])rotate(90,[0,1,0])cylinder(h=case_width+1,r=5,$fn=20);

}
}

case_holed();







