Mesh . Algorithm = 1;
Mesh . Optimize = 1;
lc =50;
lc2 =10;
Point (0) ={0 ,0 ,0 , lc };
Point (1) ={500 ,0 ,0 , lc };
Point (2) ={500 ,500 ,0 , lc };
Point (3) ={0 ,500 ,0 , lc };
Point (4) ={100 ,250 ,0 , lc2 };
Point (5) ={400 ,250 ,0 , lc2 };
Point (6) ={175 ,250 ,0 , lc2 };
Point (7) ={325 ,250 ,0 , lc2 };
Line (1) ={0 ,1};
Line (2) ={1 ,2};
Line (3) ={2 ,3};
Line (4) ={3 ,0};
Line (5) ={4 ,6};
Line (6) ={6 ,7};
Line (7) ={7 ,5};
Line Loop (1) ={1 ,2 ,3 ,4};
Ruled Surface (1) = {1};
Line {5} In Surface {1};
Line {6} In Surface {1};
Line {7} In Surface {1};
Point {6} In Surface {1};
Point {7} In Surface {1};
Physical Surface ("Reservoir",1) = {1};
Physical Line ("Fault",2) = {6, 5, 7};