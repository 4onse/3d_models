include <../utils/init.scad>;
use <funnel.scad>;
use <funnel_base.scad>;
use <funnel_up.scad>;
use <base.scad>;
use <sostegno_bascula_reed.scad>;
use <bascula.scad>;

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