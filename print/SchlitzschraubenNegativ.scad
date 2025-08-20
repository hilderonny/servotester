module SchlitzschraubenNegativ(innerDiameter = 3.4, outerDiameter = 6) {
    // Nullpunkt ist am Übergang von Gewinde zu Kopf
    cylinder(h=1000, d=innerDiameter, center=true);
    cylinder(h=1000, d=outerDiameter);
    translate([0,0,-1.5])cylinder(h=1.5, d1=innerDiameter, d2=outerDiameter);
}

$fn=100;
SchlitzschraubenNegativ();