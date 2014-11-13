module plate(){

$fn=200;
pin_number=8;
pin_diameter=5;
Petri_dish_diameter=150;
Petri_dish_h=20;
angle=360/pin_number;
Motor_shaft_size=2;
difference(){
for (i=[1:pin_number]){
union(){
cylinder(r =((Petri_dish_diameter/2)+(1.5*pin_diameter)) ,h = 5,center = true);
rotate(0,0,angle*i)
translate([((Petri_dish_diameter/2)+(pin_diameter/2))*cos(angle*i),((Petri_dish_diameter/2)+(pin_diameter/2))*sin(angle*i),2.5])
difference(){
cylinder(r=pin_diameter,h=Petri_dish_h);
translate([((pin_diameter/2)+12)*cos(angle*i),((pin_diameter/2)+12)*sin(angle*i),Petri_dish_h/8])
rotate([0,45,angle*i])
cube([30,30,10], center=true);
}
}
}
translate([0,0,4])
cylinder(h=20,r1=Motor_shaft_size/1.7,r2=Motor_shaft_size/3, center=true);
}
};