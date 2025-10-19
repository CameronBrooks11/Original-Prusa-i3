/*
A script to increase the height of the prusa enclosure feet by <ext>mm
e.g. to allow for differences in the level of the front and rear feet.

This is achieved by importing the original_stl foot, extracting a 1mm slice from the middle of the 
foot, scaling it up by the amount of the specified extension, and inserting it above the 
bottom 6mm of the original_stl.  The space for the hexagonal nut is extended by the amount of the
extension, so that the original_stl length bolts can be used.

CJH, 31 March 2023.
(updated 01Apr23 to smooth the transition between the stretched middle slice and the top slice)
*/

original_stl = "../stl/feet-bracket-original.stl"; //path+filename of original_stl foot 
ext = 18; //amount of extension (mm)

extended_foot();

module extended_foot() {
  //create the final extended foot by subtracting the stretched nut spaces from the raw foor
  difference() {
    foot();
    //subtract nut channels so that original length bolts can be used
    translate([0, 0, 8.6 - ext]) scale([1, 1, ext]) translate([0, 0, -8.6]) nuts();
  }
}

module foot() {
  //import the original mesh
  import(original_stl);

  //scale and translate the middle 1mm slice 
  translate([0, 0, -ext * 2 + 5]) scale([1, 1, 1 + ext]) translate([0, 0, -5]) middle1mm();

  //create a new bottom slice, offset by 'ext'
  translate([0, 0, -ext]) bottom6mm();
}

module bottom6mm() {
  //extract the bottom 6mm of the mesh by subtracting a cube 
  //This preserves the indented lettering on the bottom face and the notch between the feet
  difference() {
    import(original_stl);
    translate([-40, -40, 6]) cube([80, 80, 20]);
  }
}

module middle1mm() {
  //extract a 1mm slice from the middle of the mesh, 
  //6mm above the bottom, to avoid the notch between the feet
  difference() {
    import(original_stl);
    translate([-40, -40, 7]) cube([80, 80, 20]);
    bottom6mm();
  }
}

module nuts() {
  //makes a 1mm slice of the nuts space
  difference() {
    union() {
      translate([16, 13, 8.6]) cylinder(h=20, r=5);
      translate([-13, -16, 8.6]) cylinder(h=20, r=5);
    }
    import(original_stl);
    translate([-40, -40, 9.6]) cube([80, 80, 20]);
  }
}
