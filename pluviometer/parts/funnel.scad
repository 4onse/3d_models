use <../openscad-arc/arc.scad>;
include <../utils/init.scad>;
use <../utils/junctions.scad>;
use <../utils/flags.scad>;

module funnel_middle () {
    union () {
        difference() {
            cylinder(r1=thick, r2=r_ext, h=funn_height);
            cylinder(r1=0, r2=r_int, h=funn_height);           
            //translate([0,0,funn_height-0.1])cylinder(r1=r_int, r2=r_int, h=funn_height);
            translate([0,0,-100])cylinder(r1=2, r2=2, h=funn_height);
        }
        difference() {
            translate([0,0,-8])cylinder(r1=0, r2=thick, h=8);
            //translate([0,0,funn_height-0.1])cylinder(r1=r_int, r2=r_int, h=funn_height);
            translate([0,0,-9])cylinder(r1=2, r2=2, h=funn_height);
        }
    }
}

module funnel_bottom () {
    difference() {
        cylinder(r1=r_ext, r2=thick, h=80);
        cylinder(r1=r_int, r2=0, h=80);
        cylinder(r1=thick, r2=r_int, h=funn_height);    
    }
    //cylinder(r1=thick, r2=r_int, h=funn_height);
}

/* prova junction
difference() {
    junction1();
    flags(0);
    flags(90);
    flags(180);
    flags(270);
}
translate([0,0,1]) color([1,0,0]) junction2();

*/

module funnel () {
    union () {
        translate([0,0,-0.6]) {
            translate([0,0,20]) {
                translate([0,0,funn_height]) difference() {
                    junction1();
                    flags(0);
                    flags(90);
                    flags(180);
                    flags(270);
                }

                funnel_middle();
                funnel_bottom();
            }
            difference() {
                cylinder(r1=r_ext, r2=r_ext, h=20);
                cylinder(r1=r_int, r2=r_int, h=20);
                cylinder(r1=r_int*2, r2=r_int*2, h=10);
            }
        }
        junction2();
    }
}

funnel();
//female();