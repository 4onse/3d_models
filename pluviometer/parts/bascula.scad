include <../utils/init.scad>;



module little_triangle() {
    difference() {
        linear_extrude(height=33) polygon(points=[[0,0],[0,22],[15,30],[15,0]], paths=[[0,1,2,3]]);
        color([1,0,0]) translate([0,0,33]) rotate([0,65.5560452196,0]) cube([100,100,100]);
    }
}

module little_triangle_ext() {
    color([0,0,1]) translate([0,22/20,0]) rotate([90,0,0]) linear_extrude(height=22) polygon(points=[[0,0],[0,30],[15,0]], paths=[[0,1,2]]);
}

module big_triangle() {
    difference() {
        linear_extrude(height=33) polygon(points=[[0,0],[0,22],[65.1666666667,20],[65.1666666667,2]], paths=[[0,1,2,3]]);

        color([1,0,0]) translate([0,0,33]) rotate([0,26.857374046306543,0]) cube([100,100,100]);
    }    
}

module big_triangle_ext() {
    difference() {
        linear_extrude(height=33+thick_bascula) polygon(points=[[0,0],[0,22+thick_bascula],[65.1666666667+thick_bascula,20+thick_bascula],[65.1666666667+thick_bascula,2]], paths=[[0,1,2,3]]);

        color([0,0,1]) translate([0,0,33+thick_bascula]) rotate([0,27.8393119616,0]) cube([100,100,100]);
    }
    //color([0,0,1]) translate([0,(2.2+thick_bascula)/2,0]) rotate([90,0,0]) linear_extrude(height=2.2+thick_bascula)  polygon(points=[[0,0],[0,3+thick_bascula],[6.29+thick_bascula/2,0]], paths=[[0,1,2]]);
    
}

module capienza () {
    translate([thick_bascula,thick_bascula/2,thick_bascula/2]) {
        difference() {
            big_triangle();
            little_triangle();
        }
    }
}

module body () {
    difference () {
        union () {
            translate ([-1.5,0,0]) difference() {
                big_triangle_ext();
                capienza();
            }
            
            translate([1.5,25,0]) rotate([0,0,180]) difference() {
                big_triangle_ext();
                capienza ();
            }
            difference(){
                union () {
                    rotate([0,90,90]) translate([-33,0,-1]) cylinder(r1=2,r2=2,h=24+thick_bascula);
                    rotate([0,90,90]) translate([-33,0,-1]) cylinder(r1=2,r2=6,h=thick_bascula/2);
                    rotate([0,90,90]) translate([-33,0,thick_bascula+21.5]) cylinder(r1=6,r2=2,h=thick_bascula/2);
                }
                rotate([0,90,90]) translate([-33,0,-1]) cylinder(r1=1.5,r2=1.5,h=24+thick_bascula);
            }
        }
        color([0,0,1]) translate([0,-10,33+thick_bascula/2]) rotate([0,27.8393119616,0]) cube([100,100,100]);
        color([0,0,1]) translate([0,90,33+thick_bascula/2]) rotate([0,27.8393119616,180]) cube([100,100,100]);
        translate([-50,-10,33+thick_bascula/2]) cube([100,100,100]);        
    }
}


module bascula() {
    difference() {
        union () {
            body();
            rotate([0,90,90]) translate([-thick_bascula,0,-1.75]) cylinder(r1=1.5,r2=1.5,h=25.5+thick_bascula);
            rotate([0,90,90]) translate([-thick_bascula,0,-1.5]) cylinder(r1=2,r2=3,h=thick_bascula/2);
            rotate([0,90,90]) translate([-thick_bascula,0,thick_bascula+22]) cylinder(r1=3,r2=2,h=thick_bascula/2);
        }        
        rotate([0,90,90]) translate([-thick_bascula,0,-100/2]) cylinder(r1=0.75,r2=0.75,h=100);
    }
    
}

bascula();
