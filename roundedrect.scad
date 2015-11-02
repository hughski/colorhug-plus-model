$fn=64;


// size - [x,y,z]
// radius - radius of corners
// DEPRECATED!!
module roundedRect(size, radius, center=false)
{
    x = size[0];
    y = size[1];
    z = size[2];
    translate([0,0,z/2])
    _cube_vertex_smooth2d([x,y,z],radius);
}


// size - [x,y,z]
// radius - radius of corners
module _cube_vertex_smooth3d(size,radius=1)
{
    minkowski() {
        cube([size[0]-radius*2,
              size[1]-radius*2,
              size[2]-radius*2],
             center=true);
        sphere(r=radius);
    }
}

module cube_vertex_smooth3d(size,radius=1,center=false)
{
    if (center) {
        _cube_vertex_smooth3d(size,radius);
    } else {
        translate([size[0]/2,size[1]/2,size[2]/2])
        _cube_vertex_smooth3d(size,radius);
    }
}

module _cube_vertex_smooth2d(size,radius=1)
{
    minkowski() {
        cube([size[0]-radius*2,
              size[1]-radius*2,
              size[2]],
             center=true);
        cylinder(h=0.01,r=radius);
    }
}

// size - [x,y,z]
// radius - radius of corners
module cube_vertex_smooth2d(size,radius=1,center=false)
{
    if (center) {
        _cube_vertex_smooth2d(size,radius);
    } else {
        translate([size[0]/2,size[1]/2,size[2]/2])
        _cube_vertex_smooth2d(size,radius);
    }
}

//translate([10,10,0])
color("blue")
cube([10,10,10],center=true);
color("blue")
cube([10,10,10]);


translate([10,0,0]) {
    color("red")
    cube_vertex_smooth2d([10,10,10],3,center=true);
    color("red")
    cube_vertex_smooth2d([10,10,10],3,center=false);
}

translate([20,0,0]) {
    color("yellow")
    cube_vertex_smooth3d([10,10,10],3,center=true);
    color("yellow")
    cube_vertex_smooth3d([10,10,10],3,center=false);
}

translate([30,0,0]) {
    color("purple")
    roundedRect([10,10,10],3,center=true);
}

//translate([10,0,0]) {
//    cube_vertex_smooth2d([10,10,10],2);
//}
//
//translate([20,0,0]) {
//    cube_vertex_smooth3d([10,10,10],2);
//}
