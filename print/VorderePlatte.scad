use <Gehaeuse.scad>;
use <Adafruit16x2PiPlate.scad>;

$fn=100;

module VorderePlatte() {
    difference() {
        union() {
            GehaeuseplatteXZ(b=140,t=80);
            translate([30,27,0])cylinder(d=6,h=7);
            translate([30,58,0])cylinder(d=6,h=7);
            translate([105,27,0])cylinder(d=6,h=7);
            translate([105,58,0])cylinder(d=6,h=7);
        }
        translate([25,74,12.5])rotate([180,0,0])Adafruit16x2PiPlate();
        // Holder
        translate([30,27,1])cylinder(d=3,h=7);
        translate([30,58,1])cylinder(d=3,h=7);
        translate([105,27,1])cylinder(d=3,h=7);
        translate([105,58,1])cylinder(d=3,h=7);
        // Switch hole
        translate([15,40,-1])cylinder(d=7,h=5);
        // Sparlöcher
        translate([8,8,-1])cube([18,24,4]);
        translate([8,48,-1])cube([18,24,4]);
        translate([110,8,-1])cube([22,64,4]);
        translate([34,8,-1])cube([67,16,4]);
        translate([34,62,-1])cube([39,10,4]);
    }
}

VorderePlatte();
