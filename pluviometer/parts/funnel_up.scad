use <../openscad-arc/arc.scad>;
include <../utils/init.scad>;
use <../utils/junctions.scad>;

module holes_birds () {
    x= (r_int+2) * cos(45);
    y= (r_int+2) * sin(45);
    translate([r_int+2,0,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([x,y,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([x,-y,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([-x,y,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([-x,-y,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([-r_int-2,0,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([0,r_int+2,0]) cylinder(r1=1, r2=1, h=junc_height*4);
    translate([0,-r_int-2,0]) cylinder(r1=1, r2=1, h=junc_height*4);
}

module smussatura () {
    difference() {
        cylinder(r1=r_ext+20, r2=r_int+20, h=junc_height*2);        
        cylinder(r1=r_ext, r2=r_int, h=junc_height*2);
    }
}

module funnel_up_ () {
    difference () {
        cylinder(r1=r_ext, r2=r_ext, h=r_int*1.2);
        
        cylinder(r1=r_int, r2=r_int, h=r_int*1.2);
        cylinder(r1=r_int*2, r2=r_int*2, h=junc_height-0.6);
    }
}

module funnel_up () {
    union () {
        difference () {
            funnel_up_();
            translate([0,0,(r_int*1.2)-(junc_height*2)]) smussatura();
            translate([0,0,(r_int*1.2)-(junc_height*2)]) holes_birds();
        }
        junction2();
    }
}

funnel_up();