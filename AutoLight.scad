//post to hold the servo elevated so it     doesnt hit other switch
servoholder = [13.6,6.6,20.2];

//holes for the screws to go into
screwR = 2;
screwH = 14.3;

//switch dimentions are 115.9,114.3,10
walls = [6,114.3,33];
wallsF =[103.9,6,33];

// middle peice
middle = [13.6,72.2,5.5];

//platform for holding pi pi
piSuspender = [65,30,5.5];

//the supports for the lid
supportR = 3;
supportH = 6;

//dimentions for the front/lid
lid = [104.5,102.7,4.5];

//dimentions for the pi zero w
pisize = [30,65,4];
//supports to hold pi mounting plate
left = [4,65,13];

//hole for the micro usb cable to enter and power the pi
powerhole = [6,11,6.8];

//hole for manual button
cherry = [13.995,6,13.995];
//outer ring for the cherryMX switch
outerC = [19.995,4.5,19.995];

// slants for the posts that hold the lid in. The diagnal cuts will at to clean looks and print structure.
supportC = [10,10,5];

union(){

  difference()
  {

  //connecting part to the wall
  import("C:/Users/Aaron/Desktop/3d printing disigns/Lightswitch cover.stl");

  //shaving off the top
  translate([-2,-2,6])
  cube([120,120,15]);

  }
  //adding back in the middle
  color("Cyan")
  translate([51,18.4,6])
  cube(middle);

//adding the walls
  //sides, 1 front and back 2
 //[0,108.3]

  //left wall, no cut outs for this one
  color("Grey")
  translate([0,0,6])
  cube(walls);

    difference()
    {

//Right wall, one cut out for the power
      color("Grey")
      translate([109.9,0,6])
      cube(walls);

//the cut out
      color("Black")
      translate([109.9,64.1,19])
      cube(powerhole);

    }
  //back wall, no cuts for this one
translate([6,0,6])
cube(wallsF);


    difference()
    {
// front wall, two cut outs, one for the switch, one for the area around the switch (cherry MX)
      translate([6,108.3,6])
      cube(wallsF);

      union()
      {
        //outer cut so the switch can fit
        translate([47.952,109.8,12.5])
        cube(outerC);
        // cut out for the switch
        translate([50.952,108.3,15.5])
        cube(cherry);
      }
    }





// supports for the lid of the container
  for(x = [8,107.7], y = [8,106.3])
  {
      difference()
      {
        color("Purple")
        translate([x,y,29])
        cylinder(r = supportR, h = supportH);

        for(x = [6,99.9], y = [6,98.3])
        {

            translate([x,y,29])
            rotate([-35,-35,0])
            #cube(supportC);
        }
      }

  }

//Pi mount
translate([75.9,24.65,15])
import("C:/Users/Aaron/Desktop/3d printing disigns/bottom for pi zero.stl");


	//supports for pi mounts
	translate([105.9,24.65,6])
	cube(left);


// front/top lid for enclosure
//color("Red")
//translate([6,6,35])
//cube(lid);


// Needed to ad 23.7 to the y axis becuase I need to acount for the base y

//servo holder

    for( y= [63.7,18.4])
    {
      difference(){
      //servo holder
      color("Yellow")
      translate([51,y,11.5])
      cube(servoholder);

        //adding the screw holes
        for(z = [16.1,26.24], y = [67,21.5]) // 4.10 from bottom for first screw, z
        {
        translate([51,y,z])
        rotate([90,0,90])
        cylinder(r = screwR,h = screwH);
        }
      }

    }

}
