// Gmsh project created on Thu Nov 04 10:01:46 2021
SetFactory("OpenCASCADE");


//top surface
Point(1) = {20, 40, 0, 10};
Point(2) = {-20, 40, 0, 10};
Point(3) = {-20, 0, 0, 10};
Point(4) = {20, 0, 0, 10};
Point(5) = {0, 20, 0, 0.1};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Curve Loop(1) = {3, 4, 1, 2};
Plane Surface(1) = {1};
Point{5} In Surface{1};


//bottom surface and well line
Point(6) = {20, 40, -4500, 10};
Point(7) = {-20, 40, -4500, 10};
Point(8) = {-20, 0, -4500, 10};
Point(9) = {20, 0, -4500, 10};
Point(10) = {0, 20, -4500, 0.1};
Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 6};
Line(9) = {5, 10};
Curve Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};
Point{10} In Surface{2};


//side surfaces
Line(10) = {2, 7};
Line(11) = {6, 1};
Line(12) = {3, 8};
Line(13) = {9, 4};
Curve Loop(3) = {10, 6, -12, -2};
Plane Surface(3) = {3};
Curve Loop(4) = {11, 1, 10, -5};
Plane Surface(4) = {4};
Curve Loop(5) = {13, -3, 12, 7};
Plane Surface(5) = {5};
Curve Loop(6) = {11, -4, -13, 8};
Plane Surface(6) = {6};


//regular meshing for side surfaces
Transfinite Surface {4};
Transfinite Curve {11, 10} = 10 Using Progression 1;
Transfinite Curve {5, 1} = 4 Using Progression 1;
Recombine Surface {4};
Transfinite Surface {5};
Transfinite Curve {12, 13} = 10 Using Progression 1;
Transfinite Curve {7, 3} = 4 Using Progression 1;
Recombine Surface {5};
Transfinite Surface {6};
Transfinite Curve {11, 13} = 10 Using Progression 1;
Transfinite Curve {8, 4} = 4 Using Progression 1;
Recombine Surface {6};
Transfinite Surface {3};
Transfinite Curve {10, 12} = 10 Using Progression 1;
Transfinite Curve {2, 6} = 4 Using Progression 1;
Recombine Surface {3};
Transfinite Curve {9} = 10 Using Progression 1;


//creating volume and including well line in it
Surface Loop(1) = {3, 4, 6, 1, 5, 2};
Volume(1) = {1};
Line{9} In Volume{1};


//creating physical groups
Physical Curve("BHE", 14) = {9};
Physical Volume("BHE_soil", 15) = {1};
