use <Gehaeuse.scad>;
use <Adafruit16x2PiPlate.scad>;
use <Buchsenleiste.scad>;

$fn=100;

module Oberteil() {
    difference() {
        cube([93,64,45]);
        translate([2, 2, 2]) cube([89,60,50]);
        translate([71, 25, 12.5]) rotate([90, 0, 90]) Buchsenleiste(3);
        translate([4, 60, 12.5]) rotate([180,0,0]) Adafruit16x2PiPlate();
        translate([-1, 54, 23]) rotate([90, 0, 90]) cylinder(d=8,h=4);
    }
    difference() {
        union() {
            translate([9,13,1])cylinder(d=6,h=6);
            translate([9,44,1])cylinder(d=6,h=6);
            translate([84,13,1])cylinder(d=6,h=6);
            translate([84,44,1])cylinder(d=6,h=6);
        }
        translate([9,13,2])cylinder(d=3,h=6);
        translate([9,44,2])cylinder(d=3,h=6);
        translate([84,13,2])cylinder(d=3,h=6);
        translate([84,44,2])cylinder(d=3,h=6);
    }
}

rotate([180,0,0]) Oberteil();
//translate([4, 60, 12.5]) rotate([180,0,0]) Adafruit16x2PiPlate();
//translate([69, 25, 12.5]) rotate([90, 0, 90]) Buchsenleiste(3);

