$fn = 60;

cod = 16; // collar outer diameter
cid = 12; // collar inner diameter

fod = 22.3; // fin outer diameter
fvg = 1.5; // fin vertical gap
fvt = 1; // fin vertical thickness
fvh = 26; // fins vertical height height

hsh = 42.7; // total height

tzh = 2.1; // transition zone height
hbp = 0.7; // heatbreak poke, see heatbreak() module

coh = 1.2; // collet height
ash = 62.3; // assembly height

blackplastic = [0.3, 0.3, 0.3]; // a color

module tz(z = 0) {
  translate([0, 0, z]) children();
}

module hsduct() {
  // E3D V6 Duct by joshuarowley42
  // https://www.thingiverse.com/thing:340312
  rotate([90, 0, 90])
    import("E3D V6 Duct by joshuarowley42.stl");
}
module fan() {
  fth = 6.95; // fan thickness
  translate([-15, -15 - fth, 0]) difference() {
      cube([30, fth, 30]);
      translate([14 + 1, fth + 1, 14 + 1]) rotate([90, 0, 0]) cylinder(d=28, h=fth + 2);
    }
}

module heatsink() {
  tz(hsh) rotate([0, 180, 0]) union() {
        tz(0) cylinder(d=cod, h=3.7);
        tz(3.7) cylinder(d=cid, h=6);
        tz(9.7) cylinder(d=cod, h=3);
        tz(12.7) cylinder(d=8, h=4);
        tz(12.7 + fvg) cylinder(d=16, h=fvt);
        tz(hsh - fvh) cylinder(d1=8, d2=12, h=fvh);
        tz(hsh - fvh)for (fin = [0:10]) {
          tz(fin * (fvg + fvt)) cylinder(d=fod, h=fvt);
        }
      }
}

module heaterblock() {
  x = 16;
  y = 23;
  z = 11.5;
  translate([-x / 2, -x / 2, 0]) cube([x, y, z]);
}

module heatersock() {
  x = 19;
  y = 26;
  z = 10.5;
  translate([-x / 2, -x / 2, 0.5]) cube([x, y, z]);
}

module heatbreak() {
  // i'm not modelling the whole thing
  // just the transition zone
  // and the bit which pokes up
  // which is 0.7mm on my assembled V6

  tz(19.5 - tzh) cylinder(d=2.95, h=tzh);
  tz(19.5 - tzh - hbp) cylinder(d=6, h=hbp);
}

module nozzle() {
  // accurate for 0.4mm anyway
  cylinder(d1=1, d2=(1.155 * 2 + 1), h=2);
  tz(2) cylinder(d=7, h=3, $fn=6);
  tz(5) cylinder(d=5, h=1.5);
}

module collet() {
  cylinder(d=7, h=coh);
}

module e3dv6() {
  // bowden collet
  tz(ash) color(blackplastic) collet();

  // heatsink and fan duct
  tz(19.5) color("silver") heatsink();
  tz(19.5) color("blue", 0.6) hsduct();
  tz(19.5) color(blackplastic) fan();

  // transition zone
  tzh = 2.1; // transition zone height
  tz(19.5 - tzh) color("silver") cylinder(d=2.95, h=tzh);

  // heater block
  tz(19.5 - tzh - hbp - 11.5) color("silver") heaterblock();
  tz(19.5 - tzh - hbp - 11.5) color("darkturquoise") heatersock();

  // heatbreak(not really)
  color("silver") heatbreak();

  // nozzle
  color("goldenrod") nozzle();
}

// some ideas for translation

// Z=0 is end of nozzle, heatsink goes up from there
//e3dv6();

// Z=0 is top of heatsink
// tz(-ash) e3dv6(); 

// Z=0 is top of collar mount
// tz(-ash+3.7) e3dv6();

// Z=0 is bottom of collar mount
tz(-ash + 3.7 + 6) e3dv6();
