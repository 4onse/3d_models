include <utils/init.scad>;
use <parts/funnel.scad>;
use <parts/funnel_base.scad>;
use <parts/funnel_up.scad>;
use <parts/base.scad>;
use <parts/sostegno_bascula_reed.scad>;
use <parts/bascula.scad>;

module rain_gauge_part1 () {
    translate([0,0,30+4]) basement();
    //color([1,0,0]) translate([0,0,0]) funnel_base();
    color([0,1,0]) translate([0,0,100]) funnel();
    color([0,0,1]) translate([0,0,100+(r_int*2)]) funnel_up();
    translate([0,0,30+8]) sostegno_bascula_reed();
    rotate([0,0,90]) translate([0,(-33+07)/2,30+04+30.9]) bascula();
}

   
rain_gauge_part1();

//$fn=1;