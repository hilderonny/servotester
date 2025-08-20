
module Unterteil() {
    cube([93,64,2]);
    translate([2, 2, 2]) difference() {
        cube([89,60,2]);
        translate([2, 2, -1]) cube([85,56,4]);
    }
}

Unterteil();

