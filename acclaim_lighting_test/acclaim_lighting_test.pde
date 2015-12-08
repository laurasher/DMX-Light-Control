import dmxP512.*;
import controlP5.*;
import processing.serial.*;

DmxP512 dmxOutput;
ControlP5 cp5;


//* This should work with Acclaim Lighting Dyna Graze HO EXterior DMX RGB setting *//
// Need to put in RGB configuration (if can). 
// Check serial number. 
boolean RGBW = false; 

//* Set number of lights here *//
int num_lights = 12;

//* Assign enttec port to dmxpro object *//
String DMXPRO_PORT = "/dev/tty.usbserial-ENWER12L";
int DMXPRO_BAUDRATE=115000;
int universeSize = num_lights*3;

int RED = 0;
int GREEN = 0;
int BLUE = 0;
int WHITE = 0;

int[] red_channel = new int[num_lights];
int[] green_channel = new int[num_lights];
int[] blue_channel = new int[num_lights];
int[] white_channel = new int[num_lights];


void setup() {
  background(#9A9A9A);
  size(200,500);
  noStroke();
  cp5 = new ControlP5(this);
  
  //* Set up channel addresses *//
  int i = 0;
  for (int ind=0; ind<num_lights; ind++){
    red_channel[ind] = i+1;
    green_channel[ind] = i+2;
    blue_channel[ind] = i+3;
    if(RGBW){
      white_channel[ind] = i+4;
    }
    if(RGBW){
      i=i+4;
    }
    else{
      i=i+3;
    }
  }
  
  dmxOutput=new DmxP512(this, universeSize, false);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
  dmxOutput.reset();

  colorMode(RGB, 1);
  
  //Slider gui
     int slider_width = 15; int slider_height = 300; int space_between = 40;
     int red_start_val = 0; int red_x_loc = 40; int red_y_loc = 100; 
     int green_start_val = 0; int green_x_loc = red_x_loc+space_between; int green_y_loc = 100;
     int blue_start_val = 0; int blue_x_loc = green_x_loc + space_between; int blue_y_loc = 100;
    
     cp5.addSlider("RED")
         .setRange(0,255)
         .setValue(0)
         .setPosition(red_x_loc,red_y_loc)
         .setSize(slider_width,slider_height)
         .setSliderMode(Slider.FLEXIBLE)
         ;
      cp5.addSlider("GREEN")
         .setRange(0,255)
         .setValue(0)
         .setPosition(green_x_loc,green_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);  
      cp5.addSlider("BLUE")
         .setRange(0,255)
         .setValue(0)
         .setPosition(blue_x_loc,blue_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);
      
      cp5.getController("RED").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("RED").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("GREEN").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("GREEN").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("BLUE").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("BLUE").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
   
   println("red"); println(red_channel);
   println("green"); println(green_channel);
   println("blue"); println(blue_channel);
   println("white"); println(white_channel);
   
}



void draw(){
  //Go through array of channels
  for (int i=0; i<num_lights; i++){
    dmxOutput.set(red_channel[i], RED);
    dmxOutput.set(green_channel[i], GREEN);
    dmxOutput.set(blue_channel[i], BLUE);
    if(RGBW){
      dmxOutput.set(white_channel[i], WHITE);
    }
}
}

