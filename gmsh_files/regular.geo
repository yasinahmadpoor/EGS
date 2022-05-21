// Gmsh project created on Thu Nov 04 10:01:46 2021
SetFactory("OpenCASCADE");

Point(1) = {10, 20, 0, 70};
Point(2) = {-10, 20, 0, 70};
Point(3) = {-10, 0, 0, 70};
Point(4) = {10, 0, 0, 70};
Point(5) = {0, 10, 0, 0.5};
Point(8) = {0, 10, -70, 0.5};
Point(6) = {0, 10, -10, 0.5};
Point(7) = {0, 10, -60, 0.5};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {6, 7};

Curve Loop(1) = {2, 3, 4, 1};
Plane Surface(1) = {1};




Transfinite Curve {3, 2, 1, 4} = 6 Using Progression 1;


//+
Extrude {0, 0, -70} {
  Surface{1}; Layers {20}; Recombine;
}

Point{5} In Surface{1};
Point{8} In Surface{6};

Transfinite Curve {5} = 50 Using Progression 1;
//Volume(1) = {1};
Line{5} In Volume{1};

Physical Curve("BHE", 8) = {5};
Physical Volume("BHE_soil", 9) = {1};