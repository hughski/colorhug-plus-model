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

module colorhug_glass()
{
    color([0.8,0.8,1.0,0.3])
    cylinder(d=25.4, h=1);
}

// This is a the main PCB
module colorhug_pcb()
{
    size_x = 27;
    size_y = 43;

    translate([-size_x/2,-size_y/2,0]) {
        union(){
            // led
            color([1,0,1])
            translate([size_x/2,6,-6]) {
                rotate([30,0,0])
                cylinder(d=5, h=6);
                sphere(d=5, h=6);
            }

            // lamp
            color([0.8,0.8,0])
            translate([size_x/2,37,-6]) {
                rotate([-30,0,0])
                cylinder(d=5, h=6);
                sphere(d=5, h=6);
            }

            // socket
            color([0.2,0.2,0.2])
            translate([7.4,21.6,-3.4]) {
                cube([12,3.4,3.4]);
                translate([-1,(3.4-1)/2,2])
                cube([14,1,1.4]);
                translate([7,3.4,0])
                cube([3,0.5,1]);
            }

            // CPU
            translate([3.5,14,1.6])
            color([0.1,0.1,0.1])
            cube([10,10,0.8]);

            // SRAM
            translate([9,28,1.6])
            color([0.1,0.1,0.1])
            cube([3.8,5,1.5]);

            // TEMP
            translate([7,5,1.6])
            color([0.1,0.1,0.1])
            cube([3.8,5,1.5]);

            // CLOCK
            translate([21,17,1.6])
            color([0.1,0.1,0.1])
            cube([4.5,10,0.5]);
            translate([21.2,17.2+2.05,1.6])
            color([0.7,0.7,0.7])
            cube([4.1,9.6-2.05*2,3.8]);
            translate([21.2+2.05,17.2+2.05,1.6])
            color([0.7,0.7,0.7])
            cylinder(d=4.5-0.4, h=3.8);
            translate([21.2+2.05,17.2-2.05+9.6,1.6])
            color([0.7,0.7,0.7])
            cylinder(d=4.5-0.4, h=3.8);

            // PSU
            translate([22,30,1.6])
            color([0.1,0.1,0.1])
            cube([2.5,5,1.2]);

            // LEDs
            translate([23,4,1.6])
            color([1,0.1,0.1])
            cube([2,1,.3]);
            translate([23,4+1.2,1.6])
            color([0.1,1,0.1])
            cube([2,1,.3]);

            // socket
            difference(){
                union() {
                    translate([9.7,36,1.6+2])
                    color([0.7,0.7,0.7])
                    cube([7.7,8.7,2]);

                    translate([9.7+0.5,36,1.6])
                    color([0.7,0.7,0.7])
                    cube([7.7-0.5*2,8.7,4]);
                }

                translate([9.7+0.5+0.25,36+1,1.6+0.25])
                cube([7.7-0.5*2-0.25*2,8.7,4-0.25*2]);

                translate([9.7+0.25,36+1,1.6+2+0.25])
                cube([7.7-0.5,8.7,2-0.5]);
            }
        }

        // PCB
        difference() {
            color([0,0.3,0,1])
            cube([size_x,size_y,1.6]);

            // cut the corners off
            translate([0,-8,-1])
            rotate([0,0,45])
            color([0,0.5,0,1])
            cube([11.3,11.3,10]);

            // cut the corners off
            translate([size_x,-8+size_y,-1])
            rotate([0,0,45])
            color([0,0.5,0,1])
            cube([11.3,11.3,10]);

            // screw holes
            translate([22.5,1.0+11+0.5,-1])
            cylinder(d=2.5, h=3);

            translate([size_x-5-18+0.5,size_y-2.5,-1])
            cylinder(d=2.5, h=3);

        }
    }
}

module colorhug_box_lid(clr=[0.2,0.2,0.2,1])
{
    size_x = 35;
    size_y = 50;
    size_z = 4.22;

    // screw holes
    color(clr)
    difference() {
        translate([5.5-size_x/2,5.5-size_y/2,1-0.01])
        cylinder(d=4.8, h=4.0);
        translate([5.5-size_x/2,5.5-size_y/2,0])
        cylinder(d=2.9, h=6);
    }

    color(clr)
    difference() {
        translate([size_x/2-5.5,size_y/2-5.5,1-0.01])
        cylinder(d=4.8, h=4);
        translate([size_x/2-5.5,size_y/2-5.5,0])
        cylinder(d=2.9, h=6);
    }

    color(clr)
    difference() {
        union(){
            translate([0,0,0.5])
            cube_vertex_smooth2d([size_x,size_y,1],size_z-1.22,center=true);
            translate([0,0,size_z/2])
            cube_vertex_smooth2d([size_x-4.3,size_y-4.3,size_z],1,center=true);
        }

        // scoop middle
        translate([0,0,3+1])
        cube_vertex_smooth2d([size_x-6.27,size_y-6.27,6],1,center=true);

        // big circular cut
        translate([0,0.5,-1])
        cylinder(d=26, h=6);
    }
}

module colorhug_box_body(clr=[0.3,0.3,0.3,1])
{
    size_x = 35;
    size_y = 50;
    size_z = 17;

    // screw holes
    color(clr)
    difference() {
        translate([-23.3/2,5.5-size_y/2,2.5])
        cylinder(d=5.7, h=14);
        translate([-23.3/2,5.5-size_y/2,0])
        cylinder(d=2.7, h=10);
    }
    color(clr)
    difference() {
        translate([23.3/2,size_y/2-5.5,2.5])
        cylinder(d=5.8, h=14);
        translate([23.3/2,size_y/2-5.5,0])
        cylinder(d=2.7, h=10);
    }

    // pcb pillar
    color(clr)
    difference() {
        translate([-23.3/2,10,size_z-3-2.01])
        cylinder(d=3.8, h=4);
        translate([-23.3/2,10,size_z-3-3])
        cylinder(d=1.4, h=10);
    }
    color(clr)
    difference() {
        translate([23.3/2,-10,size_z-3-2.01])
        cylinder(d=3.8, h=4);
        translate([23.3/2,-10,size_z-3-3])
        cylinder(d=1.4, h=10);
    }


    // plastic screw
    translate([10.5,-16.25,14.75])
    color([0.8,0.8,0.9,0.3])
    cylinder(d=2, h=2);

    // shell
    color(clr)
    difference() {

        translate([0,0,size_z/2]) {
            cube_vertex_smooth3d([size_x,size_y,size_z],3,center=true);
            translate([0,0,-3])
            cube_vertex_smooth2d([size_x,size_y,size_z-6],3,center=true);
        }

        // scoop
        translate([0,0,size_z/2-2])
        cube_vertex_smooth3d([size_x-2*2,size_y-2*2,size_z],1.5,center=true);

        // usb hole
        translate([0,size_y/2-3,10.5+2])
        rotate([-90,0,0])
        roundedRect([8.5,5,4.2],1);

        // led hole
        translate([10.5,-16.25,10])
        cylinder(d=2, h=10);

    }

}

module colorhug_foam_pad(){
    color([0.25,0.25,0.25,0.95])
    difference() {
        roundedRect([33,47,6],3.5);
        translate([0,0,-1])
        roundedRect([15,24,8],2.5);
    }
}

colorhug_pcb();