use <../openscad-arc/arc.scad>;
include <../utils/init.scad>;
use <../utils/junctions.scad>;
use <../utils/flags.scad>;
use <piastra.scad>;

module funnel_up () {
    difference () {
        cylinder(r1=r_ext, r2=r_ext, h=height);
        
        cylinder(r1=r_int, r2=r_int, h=height);
        // cylinder(r1=r_int*2, r2=r_int*2, h=junc_height);
    }
}

module funnel_base () {
    union () {
        translate([0,0,height]) difference() {
            junction1();
            flags(0);
            flags(90);
            flags(180);
            flags(270);
        }
        funnel_up();
        junction2();
        piastra();
    }
}

funnel_base();