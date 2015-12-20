camera_length=44.5;
mount_length=44.5;
displacemnent_height=7;
wall_thickness=3;
wall_height=50;
overhang_length=20;


union() {
    lengh_of_connection_to_base=4; // this might have to be adjusted if the edges are to long
    ends_of_bar=camera_length/2+wall_thickness/2;
    ends_of_base=mount_length/2+wall_thickness/2-3;
    y_of_ends=overhang_length/2+displacemnent_height/2-lengh_of_connection_to_base;
cube([camera_length,displacemnent_height,wall_height],center=true);
translate([ends_of_bar,y_of_ends,0])  cube([wall_thickness,overhang_length,wall_height],center=true);
translate([-ends_of_bar,y_of_ends,0])  cube([wall_thickness,overhang_length,wall_height],center=true);
    translate([ends_of_base,-y_of_ends,0])  cube([wall_thickness,overhang_length,wall_height],center=true);
translate([-ends_of_base,-y_of_ends,0])  cube([wall_thickness,overhang_length,wall_height],center=true);

}