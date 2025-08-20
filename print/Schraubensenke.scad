module SchraubensenkeNegativ(diameter = 3) {
    // 3 hält gerade so, bei kleinerem Durchmesser macht die Brücke oben Probleme.
    // Besser bei Bedarf noch eine Mutter von hinten dran machen
    cylinder(h=20, d=diameter, center=true);
}

module SchraubensenkenHalter() {
    difference() {
        union() {
            cube([6,8,4]);
            translate([6,4,0])cylinder(d=8,h=4);
        };
        translate([6,4,0])SchraubensenkeNegativ();
    }
}

$fn = 100;
SchraubensenkenHalter();