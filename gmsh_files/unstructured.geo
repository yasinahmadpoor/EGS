// Gmsh project created on Thu Nov 04 10:01:46 2021
SetFactory("OpenCASCADE");


//top surface
Point(1) = {10, 20, 0, 10};
Point(2) = {-10, 20, 0, 10};
Point(3) = {-10, 0, 0, 10};
Point(4) = {10, 0, 0, 10};
Point(5) = {0, 10, 0, 1};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Curve Loop(1) = {3, 4, 1, 2};
Plane Surface(1) = {1};
Point{5} In Surface{1};


//bottom surface
Point(7) = {10, 20, -70, 10};
Point(8) = {-10, 20, -70, 10};
Point(9) = {-10, 0, -70, 10};
Point(10) = {10, 0, -70, 10};
Point(11) = {0, 10, -70, 1};
Line(5) = {7, 8};
Line(6) = {8, 9};
Line(7) = {9, 10};
Line(8) = {10, 7};
Curve Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};
Point{11} In Surface{2};


//line source
Point(6) = {0, 10, -10, 1};
Point(12) = {0, 10, -60, 1};
Line(9) = {6, 12};


//side surfaces
Line(10) = {9, 3};
Line(11) = {8, 2};
Line(12) = {7, 1};
Line(13) = {10, 4};
Curve Loop(3) = {12, 1, -11, -5};
Plane Surface(3) = {3};
Curve Loop(4) = {12, -4, -13, 8};
Plane Surface(4) = {4};
Curve Loop(5) = {13, -3, -10, 7};
Plane Surface(5) = {5};
Curve Loop(6) = {6, 10, -2, -11};
Plane Surface(6) = {6};



//regular meshing for side surfaces
Transfinite Surface {3};
Transfinite Curve {12, 11} = 3 Using Progression 1;
Transfinite Curve {5, 1} = 3 Using Progression 1;
Recombine Surface {3};
Transfinite Surface {4};
Transfinite Curve {12, 13} = 3 Using Progression 1;
Transfinite Curve {4, 8} = 3 Using Progression 1;
Recombine Surface {4};
Transfinite Surface {5};
Transfinite Curve {13, 10} = 3 Using Progression 1;
Transfinite Curve {3, 7} = 3 Using Progression 1;
Recombine Surface {5};
Transfinite Surface {6};
Transfinite Curve {10, 11} = 3 Using Progression 1;
Transfinite Curve {6, 2} = 3 Using Progression 1;
Recombine Surface {6};


//creating volume and including well line in it
Surface Loop(1) = {3, 4, 6, 1, 5, 2};
Volume(1) = {1};
Line{9} In Volume{1};

//creating physical groups
Physical Curve("BHE", 14) = {9};
Physical Volume("BHE_soil", 15) = {1};