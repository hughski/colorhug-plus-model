/*
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the CERN Open Hardware Licence v1.1
 *
 * Through this CERN Open Hardware Licence ("CERN OHL") version 1.1, the
 * Organization wishes to disseminate its hardware designs (as published
 * on http://www.ohwr.org/) as widely as possible, and generally to
 * foster collaboration among public research hardware designers.  The
 * CERN OHL is copyright of CERN. Anyone is welcome to use the CERN OHL,
 * in unmodified form only, for the distribution of his own Open Hardware
 * designs. Any other right is reserved.  
 */

use <spark.scad>
use <colorhug.scad>
use <colorhug-lightguide.scad>

$fn=64;

// completed model
module colorhug_plus()
{
    // pcb
    if (1) {
        rotate([0,0,90])
        translate([0,0,explode*1.5])
        colorhug_pcb();
    }


    // box body
    if (1) {
        translate([0,-0,-9+explode*3])
        rotate([0,0,90])
        colorhug_box_body();
    }

    // show sensor in position
    if (1) {
        rotate([0,180,-90])
        translate([0,0, 4.01-explode])
        ocean_optics_spark();
    }

    // main lightguide
    if (1) {
        translate([0,0.0,-9])
        colorhug_lightguide(1);
    }

    // glass
    if (1) {
        translate([0,0,-10.1-explode*0.25])
        colorhug_glass();
    }

    // box lid
    if (1) {
        translate([0,0,-10+-explode*0.85])
        rotate([0,0,90])
        colorhug_box_lid();
    }

    // foam pad
    if (1) {
        translate([0,0,-16-explode*1.2])
        rotate([0,0,90])
        colorhug_foam_pad();
    }
}

// for animation
animate=false;
explode_max=14;
explode=abs($t*explode_max*2-explode_max);
//explode=0;

if (animate) {
    rot_x = abs(1*$t-0.5)*0.25*360+90+45;
    rot_y = abs(1*$t-0.5)*0.125*360-45/2;
    rot_z = 360*$t;
    rotate([rot_x,rot_y,rot_z])
        colorhug_plus();
} else {
    colorhug_plus();
}
