small_tube_dim= 26.85;
small_tube_thickness=7;
small_tube_focus_ring_pos=20;
small_tube_focus_ring_deapth=2;
small_tube_focus_ring_heigt=2.2;
large_tube_dim=50;  // 42 mm lens
large_tube_thickness=8.5;
$fn=200;
dim2 =42;


difference() {
    cylinder(h=5,d=large_tube_dim);
    translate([0,0,-5]) cylinder(h=1000,d=large_tube_dim-large_tube_thickness);
};





difference(){
    difference() {
        
        cylinder(h=30,d=small_tube_dim);
        translate([0,0,-5]) cylinder(h=1000,d=small_tube_dim-small_tube_thickness);
    };
    translate([0,0,small_tube_focus_ring_pos])
    difference() {
        deap = 1;
        cylinder(h=small_tube_focus_ring_heigt,d=small_tube_dim+10);
        translate([0,0,-5]) cylinder(h=1000,d=small_tube_dim-small_tube_focus_ring_deapth);
    };
}