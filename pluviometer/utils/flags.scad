use <../openscad-arc/arc.scad>;
include <init.scad>;

// sedi congiunzione femmina

module female () {
    difference () {
        union () {
            3D_arc(w=thick/2, r=r_int+(thick/2), deg=10, fn=200, h=4);
            rotate([0,0,4.1]) 3D_arc(w=thick/2, r=r_int+(thick/2), deg=2.7, fn=200, h=10);
            translate([-3,-0.2,8.5]) rotate([0,45,4.1]) 3D_arc(w=thick/2, r=r_int+(thick/2), deg=2.7, fn=200, h=10);
            translate([3,0.2,8.5]) rotate([0,-45,4.1]) 3D_arc(w=thick/2, r=r_int+(thick/2), deg=2.7, fn=200, h=10);
        }
        //translate([-3,0,10]) 3D_arc(w=thick, r=r_int+(thick/2), deg=16, fn=200, h=120);
        rotate([0,45,0]) translate([5,0,7]) 3D_arc(w=thick, r=r_int+(thick/2), deg=10, fn=200, h=4);        
    }
}

module flags (angle) {
    union () {
        rotate([0,0,angle+2.5]) female();
    }
}

// sedi congiunzione maschio

module male() {
    difference () {
        3D_arc(w=thick/2-0.4, r=r_int+(thick/2), deg=2.5, fn=200, h=3);
        translate([1,0,2.5]) rotate([0,45,0]) 3D_arc(w=thick, r=r_int+(thick/2), deg=2, fn=200, h=2);
        translate([-1,0,2.5]) rotate([0,-45,0]) 3D_arc(w=thick, r=r_int+(thick/2), deg=2, fn=200, h=2);
    }
}

module flags2 (angle) {
    union () {
        rotate([0,0,angle+1.25]) male();
    }
}

flags2(0);