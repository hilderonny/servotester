module Buchsenleiste(pins=10) {
    color("darkgrey") difference() {
        cube([pins * 2.54, 2.54, 11]);
        //for(i = [0:pins - 1]) translate([1.02 + i * 2.54, 1.02, -1]) cube([.5, .5, 10]);
    }
    color("gold") for(i = [0:pins - 1]) translate([1.02 + i * 2.54, 1.02, 11]) cube([.5, .5, 12]);
}

Buchsenleiste();