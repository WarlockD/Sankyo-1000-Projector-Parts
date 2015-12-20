test_wall_thickness=3;
module test_bar ( hole_between_length,hole_dim ) { 
    test_bar_length=round(hole_between_length+hole_dim*2);
   difference() {
    $fn=200;
    cube([test_bar_length,8,test_wall_thickness],center=true);
    translate([-hole_between_length/2,0,-1]) cylinder(h=50,d=hole_dim,center=true);
    translate([(hole_between_length/2),0,-1]) cylinder(h=50,d=hole_dim,center=true);
}

   
}
module test_plate( hole_between_length,hole_dim ) { 
    test_plate_length=round(hole_between_length)+hole_dim*2;
    pos=hole_between_length/2;
   difference() {
    $fn=200;
    cube([test_plate_length,test_plate_length,test_wall_thickness],center=true);
    translate([-hole_between_length/2,-hole_between_length/2,-1]) cylinder(h=50,d=hole_dim,center=true);
    translate([pos,pos,-1]) cylinder(h=50,d=hole_dim,center=true);
    translate([-pos,pos,-1]) cylinder(h=50,d=hole_dim,center=true);
    translate([pos,-pos,-1]) cylinder(h=50,d=hole_dim,center=true);
    translate([-pos,-pos,-1]) cylinder(h=50,d=hole_dim,center=true);
}
   
}
//translate([0,30,0]) test_plate(25,3.5);



projector_mount_length=43.46;
lamp_mount_length=30;
screw_size = 3.5; // they are 3mm
lamp_mount_height = -10;
lamp_mount_pos_y = lamp_mount_length/2 + screw_size *2- test_wall_thickness*2+1;


//translate([0,-30,0]) 
difference(){
    union() {
    test_bar(projector_mount_length,screw_size);
      //  rotate([0,90,0]) translate([lamp_mount_pos_y,lamp_mount_height,0]) union {
      //      test_bar(lamp_mount_length,screw_size);   
       //     translate([0,8,0]) cube([
       // }
        rotate([0,270,0]) translate([lamp_mount_pos_y,lamp_mount_height,0]) difference() {
            tplate_length=round(abs(lamp_mount_length))+screw_size*2;
            union() {
                
                test_bar(lamp_mount_length,screw_size);  
                translate([0,8,0]) 
                    cube([tplate_length,abs(lamp_mount_height),test_wall_thickness],center=true);
            }
            cube([tplate_length/2,abs(lamp_mount_height),test_wall_thickness+4],center=true);
       
    }
      sensor_pole=projector_mount_length/2-screw_size/5;
     // This is for the sensor, just use wire ties?
   translate([-sensor_pole,-22,0])  union() {
       sensor_pole_indent=test_wall_thickness-0.5;///2;
       cube([8,40,test_wall_thickness],center=true);
       rotate([0,90,0]) translate([-3,-10,-sensor_pole_indent]) cube([8,40/2,test_wall_thickness],center=true);
   };

};
   translate([-23,-35,0]) cube([7,5,5],center=true);
}