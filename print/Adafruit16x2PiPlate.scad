
$fn=100;

module Button() {
    color("silver") cube([6,6,4]);
    color("black") translate([3,3,0])cylinder(d=3.5,h=5);
}

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

module Adafruit16x2PiPlate() {
    // Plates and holes
    difference() {
        color("darkcyan") union() {
            // Base plate
            cube([85,56,1.5]);
            // LCD plate
            translate([2.5,13.5,1.5])cube([80,36,4]);
        }
        // Holes
        translate([5,16,-1])cylinder(d=3,h=7.5);
        translate([80,16,-1])cylinder(d=3,h=7.5);
        translate([5,47,-1])cylinder(d=3,h=7.5);
        translate([80,47,-1])cylinder(d=3,h=7.5);
    }
    // LCD
    color("blue") translate([8,18,5.5])cube([69,25,7.1]);
    color("white") translate([77,21,5.5])cube([5.5,18.5,3]);
    // IC
    color("black") translate([1.5,2.5,1.5])cube([35,8.5,4]);
    // Dimmer
    color("orange") translate([39.5,3,1.5]) {
        cube([6.5,7,4.5]);
        translate([3.25,3.5,0])cylinder(d=5,h=6);
    }
    // Buttons
    translate([49,4,1.5]) Button(); // Select
    translate([58.5,3.5,1.5])Button(); // Left
    translate([68,7,1.5])Button(); // Up
    translate([68,.5,1.5])Button(); // Down
    translate([77.5,3.5,1.5])Button(); // Right
    // Bottom header
    color("black") translate([1,50,-13.5])cube([33,5,13.5]);
    // Header pins
    color("silver") translate([1,50,1.5])cube([33,5,3]);
    color("silver") translate([10,47,5.5])cube([40,1,5]);
    // Resistors
    color("yellow") translate([46,50,1.5])cube([11,2,2]);
    color("yellow") translate([58.75,50,1.5])cube([11,2,2]);
    color("yellow") translate([71.5,50,1.5])cube([11,2,2]);
    // Button headers
    translate([48,-.5,6.5]) color("white") Cross();
}

Adafruit16x2PiPlate();
//Cross();