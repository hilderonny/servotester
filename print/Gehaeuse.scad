use <SchlitzschraubenNegativ.scad>;
use <Schraubensenke.scad>;

$fn=100;

/**
 * Boden oder Deckel
 */
module GehaeuseplatteXY(b=32,t=32,h=2,sws=2) {
    difference() {
        union() {
            cube([b,t,h]);
            
            translate([10+sws,4+sws,h-2])cylinder(d=8,h=4);
            translate([4+sws,10+sws,h-2])cylinder(d=8,h=4);
            
            translate([b-10-sws,4+sws,h-2])cylinder(d=8,h=4);
            translate([b-4-sws,10+sws,h-2])cylinder(d=8,h=4);
            
            translate([10+sws,t-4-sws,h-2])cylinder(d=8,h=4);
            translate([4+sws,t-10-sws,h-2])cylinder(d=8,h=4);
            
            translate([b-10-sws,t-4-sws,h-2])cylinder(d=8,h=4);
            translate([b-4-sws,t-10-sws,h-2])cylinder(d=8,h=4);
        }
        translate([10+sws,4+sws,h])rotate([180,0,0])SchlitzschraubenNegativ();        
        translate([4+sws,10+sws,h])rotate([180,0,0])SchlitzschraubenNegativ();        

        translate([b-10-sws,4+sws,h])rotate([180,0,0])SchlitzschraubenNegativ();
        translate([b-4-sws,10+sws,h])rotate([180,0,0])SchlitzschraubenNegativ();

        translate([10+sws,t-4-sws,h])rotate([180,0,0])SchlitzschraubenNegativ();
        translate([4+sws,t-10-sws,h])rotate([180,0,0])SchlitzschraubenNegativ();

        translate([b-10-sws,t-4-sws,h])rotate([180,0,0])SchlitzschraubenNegativ();
        translate([b-4-sws,t-10-sws,h])rotate([180,0,0])SchlitzschraubenNegativ();
    }
}

/**
 * Vorn oder hinten
 */
module GehaeuseplatteXZ(b=32,t=20,h=2,sws=2) {
    cube([b,t,h]);
    translate([sws+6,2,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
    translate([b-14-sws,2,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
    translate([sws+6,t-6,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
    translate([b-14-sws,t-6,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
}

/**
 * Links oder rechts
 */
module GehaeuseplatteYZ(b=32,t=20,h=2,sws=2) {
    cube([b,t,h]);
    translate([6,2,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
    translate([b-14,2,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
    translate([6,t-6,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
    translate([b-14,t-6,sws-2])rotate([-90,-90,0])SchraubensenkenHalter();
}

module Gehaeuse(b=33,t=33,h=33,sws=2) {
    GehaeuseplatteXY(b=b,t=t,h=sws,sws=sws);
    translate([0,t,h])rotate([180,0,0])GehaeuseplatteXY(b=b,t=t,h=sws,sws=sws);
    translate([0,0,h-sws])rotate([-90,0,0])GehaeuseplatteXZ(b=b,t=h-2*sws,h=sws,sws=sws);
    translate([0,t,sws])rotate([90,0,0])GehaeuseplatteXZ(b=b,t=h-2*sws,h=sws,sws=sws);
    translate([0,t-sws,h-sws])rotate([-90,0,-90])GehaeuseplatteYZ(b=b-2*sws,t=h-2*sws,h=sws,sws=sws);
    translate([b,sws,h-sws])rotate([-90,0,90])GehaeuseplatteYZ(b=b-2*sws,t=h-2*sws,h=sws,sws=sws);
}

module GehaeuseOffen(b=33,t=33,h=33,sws=2) {
    GehaeuseplatteXY(b=b,t=t,h=sws,sws=sws);
    translate([b+10,0,0])GehaeuseplatteXZ(b=b,t=h-2*sws,h=sws,sws=sws);
    translate([0,t+10,0])GehaeuseplatteYZ(b=b-2*sws,t=h-2*sws,h=sws,sws=sws);
}

//Gehaeuse();
GehaeuseOffen();