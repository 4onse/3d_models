include <init.scad>;
use <flags.scad>;

// giunzione femmina
module junction1 () {
    union () {
        difference() {
            cylinder(r1=r_ext-(thick/2)-0.2, r2=r_ext-(thick/2)-0.2, h=junc_height);
            cylinder(r1=r_int, r2=r_int, h=junc_height);
        }
    }
}

// giunzione maschio
module junction2 () {
    union () {
        difference() {
            cylinder(r1=r_ext, r2=r_ext, h=junc_height-0.6);
            cylinder(r1=r_int+(thick/2)+0.3, r2=r_int+(thick/2)+0.3, h=junc_height-0.6);        
        }
        flags2(0);
        flags2(90);
        flags2(180);
        flags2(270);
    }
}
junction1();
junction2();