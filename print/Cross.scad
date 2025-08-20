
$fn=100;

module ButtonExtender() {
    cube([8,8,3.5]);
    translate([4,4,0])cylinder(d=5,h=8);
}

module Cross() {
    difference() {
        union() {
            translate([0,3.5,0])ButtonExtender(); // Select
            // Cross
            translate([9.5,3,0])ButtonExtender();
            translate([19,0,0])ButtonExtender();
            translate([19,6.25,0])ButtonExtender();
            translate([28.5,3,0])ButtonExtender();
        }
        translate([18,6.5,-1])cube([10,1.25,6]);
    }
}
Cross();