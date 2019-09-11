use </home/daniele/rain_gauge/openscad-arc/arc.scad>;
use <../utils/flags.scad>;
use <../utils/junctions.scad>;
include <../utils/init.scad>;

module base () {
    cylinder(r1=r_int,r2=r_int,h=thick);
}

module holes1 () {
    translate([0,0,0]) cylinder(r1=4,r2=4,h=thick*3);
    translate([0,0,0]) cylinder(r1=4,r2=4,h=thick*3);
    
    // per deflusso acqua
    
    translate([0,60,0]) cylinder(r1=15,r2=15,h=thick*3);
    translate([0,-60,0]) cylinder(r1=15,r2=15,h=thick*3);
    
    // per livellatura
    translate([65*sin(30),65*cos(30),0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([65*sin(150),65*cos(150),0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([65*sin(270),65*cos(270),0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
}

module sostegno () {
    
    difference () {
        translate([0,0,1.5/2]) cube([60,r_int*2,1.5], center=true);
        translate([0,0,-1.5/2]) difference() {
            cylinder(r1=r_int+50,r2=r_int+50,h=10);
            translate([0,0,-7]) cylinder(r1=r_int,r2=r_int,h=20);
        }
        
        translate([0,0,-1]) holes1();
        
    }
    
    difference () {
        translate([0,-60,0]) cylinder(r1=15+thick/2,r2=15+thick/2,h=25);
        translate([0,-60,-5]) cylinder(r1=15,r2=15,h=100);
        translate([0,-40,20]) rotate([-45,0,0]) {
            cube([4,60,40], center=true);
            cube([4,60,40], center=true);
        }
    }
    
    difference () {
        translate([0,60,0]) cylinder(r1=15+thick/2,r2=15+thick/2,h=25);
        translate([0,60,-5]) cylinder(r1=15,r2=15,h=100);
        translate([0,40,20]) rotate([45,0,0]) {
            cube([40,60,40], center=true);
            cube([40,60,40], center=true);
        }
    }
}

//
module sostegno_bascula () {
    difference () {
        translate([-15-thick*2/3,-10,0]) cube([thick*2/3,20,50+thick]);
        translate([-100,0,30+(thick)]) rotate([90,0,90]) cylinder(r1=1, r2=1, h=200);
    }
}

module piastra() {
    union () {
        difference() {
            union () {
                base();
                // translate([0,0,-1.6]) cylinder(r1=r_ext+2, r2=r_ext+2, h=1.6);
            }
            translate([0,0,-2]) holes1();
            translate([50,-40,-10]) cylinder(r1=8,r2=8,h=thick*4);
        }
        difference() {
            junction1();
            flags(0);
            flags(90);
            flags(180);
            flags(270);
        }
        
        translate([0,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        translate([thick,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        translate([thick*2,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        translate([thick*3,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        translate([-thick,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        translate([-thick*2,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        translate([-thick*3,r_int-20,thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([0,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([thick,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([thick*2,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([thick*3,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([-thick,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([-thick*2,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
        rotate([180,0,0])translate([-thick*3,r_int-20,-thick/2]) cube([thick/2, 35, thick], center=true);
    }
}

// piastra();