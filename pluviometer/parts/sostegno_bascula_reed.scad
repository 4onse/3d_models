use <../openscad-arc/arc.scad>;
include <../utils/init.scad>;

module sostegno_bascula_reed () {
    difference () {
        union() {
            translate([15,-15,0]) cube([thick*2/3,30,80]);
            translate([15,-15,0]) cube([20,30,thick*2/3]);
            translate([15,thick/2,0]) rotate([90,0,0]) linear_extrude(height=thick) polygon(points=[[0,0],[0,80],[20,0]], paths=[[0,1,2]]);
        }
       // per sostegni bascula
        translate([25,9,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
        translate([25,-9,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
        translate([-100,0,30]) rotate([90,0,90]) cylinder(r1=1, r2=1, h=200);
        translate([15,0,70-25/2]) cube([thick*2/3,thick*2/3,35], center=true);
        translate([-100,0,70-25]) rotate([90,0,90]) cylinder(r1=1, r2=1, h=200);
        translate([-100,0,75]) rotate([90,0,90]) cylinder(r1=1, r2=1, h=200);
    }
}


sostegno_bascula_reed();