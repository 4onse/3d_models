use <../openscad-arc/arc.scad>;
include <../utils/init.scad>;

module base () {
    cylinder(r1=r_int-(thick*2)/3,r2=r_int-(thick*2)/3,h=thick);
}

module holes1 () {
    
    // per sostegni bascula
    translate([25,9,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([25,-9,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([-25,9,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([-25,-9,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    
    // per piastra connettori
    translate([45,10,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([45,-10,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    
    // per deflusso acqua
    translate([0,-60,0]) cylinder(r1=15,r2=15,h=thick*3);
    translate([0,-50,0]) cylinder(r1=15,r2=15,h=thick*3);
    translate([0,+60,0]) cylinder(r1=15,r2=15,h=thick*3);
    translate([0,50,0]) cylinder(r1=15,r2=15,h=thick*3);
    
    // per regolatoru bascula
    translate([0,-20,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    translate([0,+20,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
    
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
            translate([0,0,-7]) cylinder(r1=r_int-(thick*2)/3,r2=r_int-(thick*2)/3,h=20);
        }
        
        translate([0,0,-1]) holes1();
        
    }
    
    difference () {
        translate([0,-60,0]) cylinder(r1=15+thick/2,r2=15+thick/2,h=25);
        translate([0,-60,-5]) cylinder(r1=15,r2=15,h=100);
        translate([0,-50,-5]) cylinder(r1=15,r2=15,h=100);
        translate([0,-40,20]) rotate([-45,0,0]) {
            cube([40,60,40], center=true);
            cube([40,60,40], center=true);
        }
    }
    
    difference () {
        translate([0,60,0]) cylinder(r1=15+thick/2,r2=15+thick/2,h=25);
        translate([0,60,-5]) cylinder(r1=15,r2=15,h=100);
        translate([0,50,-5]) cylinder(r1=15,r2=15,h=100);
        translate([0,40,20]) rotate([45,0,0]) {
            cube([40,60,40], center=true);
            cube([40,60,40], center=true);
        }
    }
}

//
module sostegno_bascula () {
    difference () {
        union () {
            translate([-15-thick*2/3,-10,0]) cube([thick*2/3,20,50+thick]);
            rotate([0,0,180]) translate([17.5,thick/2,0]) rotate([90,0,0]) linear_extrude(height=thick) polygon(points=[[0,0],[0,54],[20,0]], paths=[[0,1,2]]);
        }
        translate([-100,0,30+(thick)]) rotate([90,0,90]) cylinder(r1=1, r2=1, h=200);
    }
}

module basement() {
    difference () {
        union () {
            difference () {
                union () {
                    sostegno_bascula();
                    // sostegno livella
                    translate([-40,0,thick]) {
                        difference () {
                            cylinder(r1=8.25+thick,r2=8.25+thick,h=10);
                        }
                    }
                }
                translate([-40,0,thick]) cylinder(r1=8.25,r2=8.25,h=11);
            }
            difference() {
                union () {
                    base();
                    difference() {
                        cylinder(r1=r_int-(thick*2)/3,r2=r_int-(thick*2)/3, h=junc_height);
                        cylinder(r1=r_int-(thick*1.5),r2=r_int-(thick*1.5), h=junc_height+5);
                        translate([0,0,-1]) holes1();
                    }
                    // per regolatori bascula
                    translate([0,-20,0]) cylinder(r1=12,r2=3,h=thick*2);
                    translate([0,+20,0]) cylinder(r1=12,r2=3,h=thick*2);
                    translate([65*sin(30),65*cos(30),5]) rotate([0,0,65]) translate([5,0,0]) cube([10,10,10], center=true);
                    translate([65*sin(30),65*cos(30),0]) rotate([0,0,65]) cylinder(r1=5,r2=5,h=10);
                    translate([65*sin(150),65*cos(150),5]) rotate([0,0,130]) translate([-5,0,0]) cube([10,10,10], center=true);
                    translate([65*sin(150),65*cos(150),0]) rotate([0,0,130]) cylinder(r1=5,r2=5,h=10);
                    translate([65*sin(270),65*cos(270),5]) rotate([0,0,195]) translate([5,0,0]) cube([10,10,10], center=true);
                    translate([65*sin(270),65*cos(270),0]) rotate([0,0,195]) cylinder(r1=5,r2=5,h=10);
                    // per regolatoru bascula
                    // translate([0,-20,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
                    // translate([0,+20,0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
                    
                    // // per livellatura
                    // translate([65*sin(30),65*cos(30),0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
                    // translate([65*sin(150),65*cos(150),0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
                    // translate([65*sin(270),65*cos(270),0]) cylinder(r1=1.5,r2=1.5,h=thick*3);
                }
                translate([0,0,-1]) holes1();
            }
            sostegno();
            
            /*difference() {
                junction1();
                flags(0);
                flags(90);
                flags(180);
                flags(270);
            }*/
        }
        rotate([0,0,45]) translate([0,0,-thick]) 3D_arc(w=35, r=r_int-30, deg=45, fn=200, h=thick*3);
        rotate([0,0,45+90]) translate([0,0,-thick]) 3D_arc(w=35, r=r_int-30, deg=45, fn=200, h=thick*3);
        rotate([0,0,45+190]) translate([0,0,-thick]) 3D_arc(w=35, r=r_int-30, deg=35, fn=200, h=thick*3);
        rotate([0,0,45+260]) translate([0,0,-thick]) 3D_arc(w=35, r=r_int-30, deg=35, fn=200, h=thick*3);
    }
}

basement();