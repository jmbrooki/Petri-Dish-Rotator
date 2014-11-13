//  Scientific Equipment Project  
//  Open Source 3D Printing Fall 2014
//  Brett Barker

// Base for specimen spinner

// variables

// base parameters
h_base = 60;
w_base = 200;
l_base = 120;
shell = 10;

//shell thickness
base_scale = 1-(shell/w_base);

//arm parameters
h_arm = 150;
w_arm = 5;
l_arm = 50;
r_bolt = 10;

//motor box parameters
r_bolt = 5;
w_box = 60;

//portal parameters
pw = 10;
ph = 10;


// bottom
module base(){
	hull(){
	translate([w_box/2,0,h_base])cylinder(1,l_arm/2,l_arm/2,center=true);
	translate([w_box/-2,0,h_base])cylinder(1,l_arm/2,l_arm/2,center=true);
	cube([w_base,l_base,1],center=true);
};};

// arms
module arm_full(){
translate([0,0,0.5*l_arm])
hull(){
translate([0,0,h_arm])rotate(90,[0,1,0])cylinder(w_arm,l_arm/2,l_arm/2,center=true);
cube([w_arm,l_arm,l_arm],center=true);
};
};

// bolt hole
module arm(){
difference(){
	arm_full();
	translate([0,0,h_arm+0.5*l_arm])rotate(90,[0,1,0])cylinder(w_arm+5,r_bolt,r_bolt,center=true);
};
};
module solid_base(){
union(){
 base();
translate([w_box/2,0,0])arm();
translate([-(w_box/2),0,0])arm();
};};

module hollow_base(){
difference(){
solid_base();
translate([0,0,-1*shell])scale([base_scale,base_scale,1])base();
};};


hollow_base();

//translate([0,0,0.5*h_base])rotate(90,[1,0,0])cylinder(l_base,ph,ph,center=true)





