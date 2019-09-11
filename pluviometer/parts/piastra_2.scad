include <../utils/init.scad>;

$fn=200;

/* unità di misura centimetri */


junc_height=1;
thick = 0.4;
r_int = 7.980868845;
r_ext = r_int+thick;
funn_height=r_int*2; 

height= 9;

module base () {
    cylinder(r1=r_int,r2=r_int,h=thick);
}

module holes1 () {
    translate([0,0,0]) cylinder(r1=0.4,r2=0.4,h=thick*3);
    
    // per deflusso acqua
    
    translate([0,-6,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([0,+6,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    
    // per livellatura
    translate([6.5*sin(30),6.5*cos(30),0]) cylinder(r1=0.15,r2=0.15,h=thick*3);
    translate([6.5*sin(150),6.5*cos(150),0]) cylinder(r1=0.15,r2=0.15,h=thick*3);
    translate([6.5*sin(270),6.5*cos(270),0]) cylinder(r1=0.15,r2=0.15,h=thick*3);
}

module sostegno () {
    
    difference () {
        translate([0,0,0.15/2]) cube([6,r_int*2,0.15], center=true);
        translate([0,0,-0.15/2]) difference() {
            cylinder(r1=r_int+5,r2=r_int+5,h=1);
            translate([0,0,-0.7]) cylinder(r1=r_int,r2=r_int,h=2);
        }
        
        translate([0,0,-0.1]) holes1();
        
    }
    
    difference () {
        translate([0,-6,0]) cylinder(r1=1.5+thick/2,r2=1.5+thick/2,h=2.5);
        translate([0,-6,-0.5]) cylinder(r1=1.5,r2=1.5,h=10);
        translate([0,-4,2]) rotate([-45,0,0]) {
            cube([4,6,4], center=true);
            cube([4,6,4], center=true);
        }
    }
    
    difference () {
        translate([0,6,0]) cylinder(r1=1.5+thick/2,r2=1.5+thick/2,h=2.5);
        translate([0,6,-0.5]) cylinder(r1=1.5,r2=1.5,h=10);
        translate([0,4,2]) rotate([45,0,0]) {
            cube([4,6,4], center=true);
            cube([4,6,4], center=true);
        }
    }
}

//
module sostegno_bascula () {
    difference () {
        translate([-1.5-thick*2/3,-1,0]) cube([thick*2/3,2,5+thick]);
        translate([-10,0,3+(thick)]) rotate([90,0,90]) cylinder(r1=0.1, r2=0.1, h=20);
    }
}

// sedi congiunzione femmina
module flags (angle) {
    union () {
        translate([0,0,-0.1]) rotate([0,0,angle+2.5]) 3D_arc(w=thick/2, r=r_int+(thick/2), deg=5, fn=200, h=0.3);
        rotate([0,0,angle+1]) 3D_arc(w=thick/2, r=r_int+(thick/2), deg=2, fn=200, h=1);
    }
}

// giunzione femmina
module junction1 () {
    union () {
        difference() {
            cylinder(r1=r_ext-(thick/2), r2=r_ext-(thick/2), h=junc_height);
            cylinder(r1=r_int, r2=r_int, h=junc_height);        
        }
    }
}

module piastra() {
    union () {
        difference() {
            base();
            translate([0,0,-0.1]) holes1();
            // rotate([180,0,0])translate([0,0,-0.5]) holes1();

            translate([-3,-5,0]) cylinder(r1=0.8,r2=0.8,h=thick*3);
        }
        junction1();
        // difference() {
        //     junction1();
        //     flags(0);
        //     flags(90);
        //     flags(180);
        //     flags(270);
        // }
        
        translate([0,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        translate([thick,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        translate([thick*2,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        translate([thick*3,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        translate([-thick,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        translate([-thick*2,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        translate([-thick*3,r_int-2,thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([0,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([thick,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([thick*2,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([thick*3,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([-thick,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([-thick*2,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
        rotate([180,0,0])translate([-thick*3,r_int-2,-thick/2]) cube([thick/2, 3.5, thick], center=true);
    }
}

//piastra();