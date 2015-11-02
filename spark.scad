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

use <roundedrect.scad>

$fn=64;

module ocean_optics_spark()
{
    size_x = 18.3;
    size_y = 9.5;



    transparency=1.0;
    translate([-size_x/2-1.25,-size_y/2-0.75,0]) {
        // pcb
        difference() {
            color([0,0.3,0,transparency])
            cube([size_x,size_y,1.0]);

            // holes in PCB
            translate([1,9.5-1,-1])
            cylinder(d=1, h=3);
            translate([size_x-1,9.5-1,-1])
            cylinder(d=1, h=3);
        }

        // sensor
        translate([6, 5, 1])
        color([0,0,0,transparency])
        cube([9.1,1.1,4.0]);

        // glue
        translate([10.5, 5.5, 1])
        color([0.4,0.4,0.4,transparency])
        roundedRect([11.1,5,1.5],1);

        // label
        translate([1,1,0.55])
        color([0,0,0])
        text("#00057",size=1.5);

        // socket
        difference() {
            translate([4.4, 0.7, -5.8])
            color([0.2,0.2,0.2,transparency])
            cube([12,5.6,5.8]);

            translate([4.4-1, 0.7+1.2, -5.8-0.01])
            color([0.2,0.2,0.2,transparency])
            cube([14,3.4,4.5]);
        }
    }
}

ocean_optics_spark();
