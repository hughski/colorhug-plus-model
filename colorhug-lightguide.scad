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

// This is a the insert
module colorhug_lightguide(transparency=1.0)
{
    size_x=43;
    size_y=24;
    size_z=9.25;
    color=[0.2,0.2,0.25,transparency];

    //rotate([180,0,0])
    translate([0,0,size_z/2]) {
        difference() {

            color(color)
            cube([size_x,size_y,size_z],center=true);

            // UV LED slot
            translate([5,0,-size_z])
            color([1,0,1,transparency])
            rotate([0, 45, 0]) {
                cylinder(d=6, h=30);
                translate([0,0,12])
                cylinder(r1=3, r2=8, h=14);
            }

            // lamp slot
            translate([-5,0,-size_z]) {
                color([0.8,0.8,0,transparency])
                rotate([0, -45, 0]) {
                    cylinder(d=5, h=30);
                    translate([0,0,12])
                    cylinder(r1=2.5, r2=8, h=14);
                }
            }

            // resistors on back
            color([0.1,0.1,0.4,transparency])
            translate([0,0,size_z/2-0.49]) {
                cube_vertex_smooth2d([29,15,1],1,center=true);
                cube_vertex_smooth2d([size_x,9,1],1,center=true);
            }

            // sensor slot
            translate([0,0,0])
            color([0.1,0.1,0.4,transparency])
            cube([2,10.5,size_z+1],center=true);
            color([0.1,0.1,0.5,transparency])
            cube_vertex_smooth2d([3,12,size_z-1.40],1,center=true);

            translate([-0.8,-1.25,1])
            color([0.1,0.1,0.4,transparency])
            cube([11,20,size_z],center=true);

            // cut the corners off
            translate([size_x/2,-size_y/2-8,-size_z/2-1])
            rotate([0,0,45])
            color([0.5,0.5,0.5,transparency])
            cube([11.3,11.3,size_z+2]);

            // cut the corners off
            translate([-size_x/2,size_y/2-8,-size_z/2-1])
            rotate([0,0,45])
            color([0.5,0.5,0.5,transparency])
            cube([11.3,11.3,size_z+2]);
        }
    }
}

colorhug_lightguide();
