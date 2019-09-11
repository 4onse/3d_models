
$fn=100;

thickness=2.45;
pt=0.15;

outer_d=110;
inner_d=80;

// rod diameter
rod_d=4;
rod_l=200;

// rod diameter top plate
rod_d_top=4.9;

//
plate_h=15;

module rodholes()
{
    for(x=[0:90:360])
    {
        rotate([0,0,x])translate([35.5,0,6])difference()
        {
            cylinder(h=60,d=rod_d+pt,center=true);
        }
    }
}


module spacer()
{
    for(x=[0:90:360])
    {
        rotate([0,0,x])translate([35.5,0,0])difference()
        {
            cylinder(h=plate_h,d=rod_d+thickness*2+pt,center=true);
        }
    }
}


module rim() {
  difference () {
    cylinder(h=plate_h, r1=(outer_d/2)+thickness, r2=(inner_d/2)+thickness, center=true);
    translate([0,0,-thickness]) cylinder(h=plate_h, r1=(outer_d/2)+thickness, r2=(inner_d/2)+thickness, center=true);
  }
}

module top_plate() {
  difference () {
    union () {

      rim();

      spacer();
      support();
      reinforcement_struts();
    }
    union () {
      translate([0,0,plate_h/2-6]) rodholes_top();
      translate([0,0,-plate_h/2-1]) rodholes_top();
    }

  }

}

module plate() {
  difference() {
    union () {

      rim();
      spacer();
      support();
      reinforcement_struts();
    }
    cylinder(h=plate_h*2, d=outer_d/2, center=true);
    rodholes();
  }
}

module bottom()
{
    difference () {
        union () {
            //cylinder(h=plate_h/2, r1=15, r2=5 ,center=false);
            difference () {
              cylinder(h=5,d=(outer_d/2)+(thickness));
              cylinder(h=5,d=(outer_d/2)-(thickness-1));
            }
            
            cylinder(h=thickness, d=inner_d+thickness*2, center=true);
        }
        rodholes();
        translate([0,0,0])cylinder(h=15, d=15, center=true);
      }
}

module sensor_carrier()
{
    height=plate_h*stack_n/1.66;
    translate([0,0,height/2+thickness])cube(size=[10,2.5,height]);
}

module rodholes_top()
{
    for(x=[0:90:360])
    {
        rotate([0,0,x])translate([35.5,0,0])difference()
        {
            cylinder(h=7,d=rod_d+0.9+pt,center=false);
        }
    }
}

module support()
{
    for(x=[22.5:45:360])
    {
        rotate([0,0,x]) translate(
            [outer_d/2-17,0,6.5])rotate([90,0,0]
        ) linear_extrude(height = thickness, center = true, convexity = 10)
        {
            polygon( points=[[0,0],[3,0],[17,-14],[14,-14],[14,-14]] );
        }
    }
}

module reinforcement_struts(rot=[0:45:360],rtr=[35,0,4],cs=[18,thickness,thickness])
{
    l_ = pow(pow(cs[2], 2) + pow(cs[2], 2), 1/2);
    for(x=rot)
    {
        rotate([0,0,x])translate(rtr)
        {
            cube(size=cs,center=true);
        }
    }
}

//  difference () {
//   union() {
//     // translate([0,0,-plate_h/2]) bottom();

//     for(x=[0:6]) {
//       if (x==6) {
//         translate([0,0,plate_h*x]) union () {
//           top_plate();
//         }
//       } else {
//         translate([0,0,plate_h*x]) union () {
//           plate();
//         }
//       }

//     }
//   }

//   translate([100,0,0])cube(size=[200,200,300],center=true);
// }
// top_plate();
// bottom();

// plate();
// support();
// reinforcement_struts();
/*
for(x=[22.5:45:360])
{
    rotate([0,0,x])translate([outer_d/2-17,0,6.5])rotate([90,0,0])linear_extrude(height = thickness, center = true, convexity = 10)
    {
        polygon( points=[[0,0],[3,0],[17,-14],[14,-14],[14,-14]] );
    }
}*/

translate([0,0,18]) difference () {
  union () {
    cylinder(h=30,d=outer_d/2-thickness,center=true);
    translate([0,0,20])cylinder(h=10, d=12, center=true);
  }
  translate([0,0,-thickness]) cylinder(h=30,d=outer_d/2-thickness*2,center=true);
  translate([0,0,20])cylinder(h=10, d=7.5, center=true);
  translate([0,0,-10]) for(z=[0:5:20]) {
      translate([0,0,z]) for(x=[0:15:180]) {
          rotate([0,90,x]) cube([3,3,80],true);
      }
  }
  translate([21,0,20])cylinder(h=30, d=4, center=true);
  translate([0,0,20])cylinder(h=30, d=5.3, center=true);
}
  
 
