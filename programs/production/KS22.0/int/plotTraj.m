(*******************************************************************
This file was generated automatically by the Mathematica front end.
It contains Initialization cells from a Notebook file, which
typically will have the same name as this file except ending in
".nb" instead of ".m".

This file is intended to be loaded into the Mathematica kernel using
the package loading commands Get or Needs.  Doing so is equivalent
to using the Evaluate Initialization Cells menu command in the front
end.

DO NOT EDIT THIS FILE.  This entire file is regenerated
automatically each time the parent Notebook file is saved in the
Mathematica front end.  Any changes you make to this file will be
overwritten.
***********************************************************************)

<<SiminosUtils`









Needs["LinearAlgebra`MatrixManipulation`"]

v=Import["rpoU.dat"];





L=22.0;





tTot=200*0.4;

vPlt=ListDensityPlot[Take[v,400],Mesh\[Rule] False,ColorFunction\[Rule]hby,
      MeshRange\[Rule]{{0,L},{0.0,tTot}},FrameLabel\[Rule]{"x","t"},
      TextStyle\[Rule]{FontFamily\[Rule]Arial,FontSize\[Rule] 12},
      AspectRatio\[Rule]2];



Export[wd[]<>"rpo.eps",vPlt];

Exit[];