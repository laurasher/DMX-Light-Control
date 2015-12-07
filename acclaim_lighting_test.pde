import dmxP512.*;
import controlP5.*;
import processing.serial.*;

DmxP512 dmxOutput;
ControlP5 cp5;
int RED = 0;
int GREEN = 0;
int BLUE = 0;
int WHITE = 0;

// Assign enttec port to dmxpro object
String DMXPRO_PORT = "/dev/tty.usbserial-ENWER12L";
int DMXPRO_BAUDRATE=115000;

int num_lights = 1;
int universeSize = num_lights*4;

//ADJ on four channel setting (display should say 3001)
int red_channel = 1;
int green_channel = 2;
int blue_channel = 3;
int white_channel = 4;
int master_channel = 5;

void setup() {
  background(#9A9A9A);
  size(400,500);
  noStroke();
  cp5 = new ControlP5(this);
  
  dmxOutput=new DmxP512(this, universeSize, false);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
  dmxOutput.reset();

  colorMode(RGB, 1);
  
  //Slider gui
  int slider_width = 15; int slider_height = 300; int space_between = 40;
  int red_start_val = 0; int red_x_loc = 40; int red_y_loc = 100; 
  int green_start_val = 0; int green_x_loc = red_x_loc+space_between; int green_y_loc = 100;
  int blue_start_val = 0; int blue_x_loc = green_x_loc + space_between; int blue_y_loc = 100;
  
  int white_start_val = 0; int white_x_loc = blue_x_loc+space_between+30; int white_y_loc = 100;
  int master_start_val = 0; int master_x_loc = white_x_loc+space_between; int master_y_loc = 100;

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
  cp5.addSlider("WHITE")
     .setRange(0,255)
     .setValue(0)
     .setPosition(white_x_loc,white_y_loc)
     .setSliderMode(Slider.FLEXIBLE)
     .setSize(slider_width,slider_height);

  
  cp5.getController("RED").getValueLabel().alignX(ControlP5.CENTER);
  cp5.getController("RED").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
  
  cp5.getController("GREEN").getValueLabel().alignX(ControlP5.CENTER);
  cp5.getController("GREEN").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
  
  cp5.getController("BLUE").getValueLabel().alignX(ControlP5.CENTER);
  cp5.getController("BLUE").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
  
  cp5.getController("WHITE").getValueLabel().alignX(ControlP5.CENTER);
  cp5.getController("WHITE").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
  
}

void draw(){
  dmxOutput.set(red_channel, RED);
  dmxOutput.set(green_channel, GREEN);
  dmxOutput.set(blue_channel, BLUE);
  dmxOutput.set(white_channel, WHITE);
  println("red green blue white"+ RED , GREEN , BLUE, WHITE);
}

