import dmxP512.*;
import controlP5.*;
import processing.serial.*;

DmxP512 dmxOutput;
ControlP5 cp5;


//* To work with Acclaim Lighting Dyna Graze HO EXterior DMX RGB setting *//

//* Check serial number *//
boolean RGBW = false; 
/////////////////////////////////

//* Set number of lights here *//
int num_lights = 6;
/////////////////////////////////

//* Assign enttec port to dmxpro object *//
String DMXPRO_PORT = "/dev/tty.usbserial-ENWER12L";
int DMXPRO_BAUDRATE=115000;
int universeSize = num_lights*3;

int RED = 0;
int GREEN = 0;
int BLUE = 0;
int WHITE = 0;
int RED_2 = 0;
int GREEN_2 = 0;
int BLUE_2 = 0;
int RED_3 = 0;
int GREEN_3 = 0;
int BLUE_3 = 0;
int RED_4 = 0;
int GREEN_4 = 0;
int BLUE_4 = 0;
int RED_5 = 0;
int GREEN_5 = 0;
int BLUE_5 = 0;
int RED_6 = 0;
int GREEN_6 = 0;
int BLUE_6 = 0;


int[] red_channel = new int[num_lights];
int[] green_channel = new int[num_lights];
int[] blue_channel = new int[num_lights];
int[] white_channel = new int[num_lights];
     
     int slider_width = 15; int slider_height = 300; int space_between = 40;
     int red_start_val = 0; int red_x_loc = 40; int red_y_loc = 100; 
     int green_start_val = 0; int green_x_loc = red_x_loc+space_between; int green_y_loc = 100;
     int blue_start_val = 0; int blue_x_loc = green_x_loc+space_between; int blue_y_loc = 100;
     
     int red_x_loc_2 = blue_x_loc+space_between*2; 
     int green_x_loc_2 = red_x_loc_2+space_between; 
     int blue_x_loc_2 = green_x_loc_2+space_between; 
     
     int red_x_loc_3 = blue_x_loc_2+space_between*2; 
     int green_x_loc_3 = red_x_loc_3+space_between; 
     int blue_x_loc_3 = green_x_loc_3+space_between; 
     
     int red_x_loc_4 = blue_x_loc_3+space_between*2; 
     int green_x_loc_4 = red_x_loc_4+space_between; 
     int blue_x_loc_4 = green_x_loc_4+space_between; 
     
     int red_x_loc_5 = blue_x_loc_4+space_between*2; 
     int green_x_loc_5 = red_x_loc_5+space_between; 
     int blue_x_loc_5 = green_x_loc_5+space_between; 
     
     int red_x_loc_6 = blue_x_loc_5+space_between*2; 
     int green_x_loc_6 = red_x_loc_6+space_between; 
     int blue_x_loc_6 = green_x_loc_6+space_between; 

void setup() {
  background(#9A9A9A);
  if (num_lights==1){
    size(200,500);
  }
  else{
    size(1000,500);
  }
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

  colorMode(RGB, 255);
  
  //Slider gui
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
   
   // 2
   
      cp5.addSlider("RED_2")
          .setRange(0,255)
          .setValue(0)
          .setPosition(red_x_loc_2,red_y_loc)
          .setSize(slider_width,slider_height)
          .setSliderMode(Slider.FLEXIBLE);
      cp5.addSlider("GREEN_2")
         .setRange(0,255)
         .setValue(0)
         .setPosition(green_x_loc_2,green_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);  
      cp5.addSlider("BLUE_2")
         .setRange(0,255)
         .setValue(0)
         .setPosition(blue_x_loc_2,blue_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);
      
      cp5.getController("RED_2").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("RED_2").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("GREEN_2").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("GREEN_2").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("BLUE_2").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("BLUE_2").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
  
  // 3
      cp5.addSlider("RED_3")
          .setRange(0,255)
          .setValue(0)
          .setPosition(red_x_loc_3,red_y_loc)
          .setSize(slider_width,slider_height)
          .setSliderMode(Slider.FLEXIBLE);
      cp5.addSlider("GREEN_3")
         .setRange(0,255)
         .setValue(0)
         .setPosition(green_x_loc_3,green_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);  
      cp5.addSlider("BLUE_3")
         .setRange(0,255)
         .setValue(0)
         .setPosition(blue_x_loc_3,blue_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);
      
      cp5.getController("RED_3").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("RED_3").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("GREEN_3").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("GREEN_3").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("BLUE_3").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("BLUE_3").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
   
   // 4
   
      cp5.addSlider("RED_4")
          .setRange(0,255)
          .setValue(0)
          .setPosition(red_x_loc_4,red_y_loc)
          .setSize(slider_width,slider_height)
          .setSliderMode(Slider.FLEXIBLE);
      cp5.addSlider("GREEN_4")
         .setRange(0,255)
         .setValue(0)
         .setPosition(green_x_loc_4,green_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);  
      cp5.addSlider("BLUE_4")
         .setRange(0,255)
         .setValue(0)
         .setPosition(blue_x_loc_4,blue_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);
      
      cp5.getController("RED_4").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("RED_4").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("GREEN_4").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("GREEN_4").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("BLUE_4").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("BLUE_4").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
   
   // 5
   
      cp5.addSlider("RED_5")
          .setRange(0,255)
          .setValue(0)
          .setPosition(red_x_loc_5,red_y_loc)
          .setSize(slider_width,slider_height)
          .setSliderMode(Slider.FLEXIBLE);
      cp5.addSlider("GREEN_5")
         .setRange(0,255)
         .setValue(0)
         .setPosition(green_x_loc_5,green_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);  
      cp5.addSlider("BLUE_5")
         .setRange(0,255)
         .setValue(0)
         .setPosition(blue_x_loc_5,blue_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);
      
      cp5.getController("RED_5").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("RED_5").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("GREEN_5").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("GREEN_5").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("BLUE_5").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("BLUE_5").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
   
   // 6
   
      cp5.addSlider("RED_6")
          .setRange(0,255)
          .setValue(0)
          .setPosition(red_x_loc_6,red_y_loc)
          .setSize(slider_width,slider_height)
          .setSliderMode(Slider.FLEXIBLE);
      cp5.addSlider("GREEN_6")
         .setRange(0,255)
         .setValue(0)
         .setPosition(green_x_loc_6,green_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);  
      cp5.addSlider("BLUE_6")
         .setRange(0,255)
         .setValue(0)
         .setPosition(blue_x_loc_6,blue_y_loc)
         .setSliderMode(Slider.FLEXIBLE)
         .setSize(slider_width,slider_height);
      
      cp5.getController("RED_6").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("RED_6").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("GREEN_6").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("GREEN_6").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
      
      cp5.getController("BLUE_6").getValueLabel().alignX(ControlP5.CENTER);
      cp5.getController("BLUE_6").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(12);
   
   
   println("red"); println(red_channel);
   println("green"); println(green_channel);
   println("blue"); println(blue_channel);
   println("white"); println(white_channel);
   
}



void draw(){
  //Go through array of channels
 int inc = 0;
 if(RGBW){
   inc = 4;
 }
 else{
   inc=3;
   }
  for (int i=0; i<num_lights/2; i++){
//    int i=0;
    dmxOutput.set(red_channel[i], RED);
    dmxOutput.set(green_channel[i], GREEN);
    dmxOutput.set(blue_channel[i], BLUE);
    dmxOutput.set(red_channel[i+1], RED_2);
    dmxOutput.set(green_channel[i+1], GREEN_2);
    dmxOutput.set(blue_channel[i+1], BLUE_2);
    dmxOutput.set(red_channel[i+2], RED_3);
    dmxOutput.set(green_channel[i+2], GREEN_3);
    dmxOutput.set(blue_channel[i+2], BLUE_3);
    dmxOutput.set(red_channel[i+3], RED_4);
    dmxOutput.set(green_channel[i+3], GREEN_4);
    dmxOutput.set(blue_channel[i+3], BLUE_4);
    dmxOutput.set(red_channel[i+4], RED_5);
    dmxOutput.set(green_channel[i+4], GREEN_5);
    dmxOutput.set(blue_channel[i+4], BLUE_5);
    dmxOutput.set(red_channel[i+5], RED_6);
    dmxOutput.set(green_channel[i+5], GREEN_6);
    dmxOutput.set(blue_channel[i+5], BLUE_6);
    if(RGBW){
      dmxOutput.set(white_channel[i], 150);
    }
  }
  
  //Rectangles
  fill_rect_6(RED_5,GREEN_5,BLUE_5);
  fill_rect_5(RED_4,GREEN_4,BLUE_4);
  fill_rect_4(RED_3,GREEN_3,BLUE_3);
  fill_rect_3(RED_2,GREEN_2,BLUE_2);
  fill_rect_2(RED,GREEN,BLUE);
  fill_rect_1(RED_6,GREEN_6,BLUE_6);
  
// Presets
//  rainbow();
//  half_off();
//  outer_two_on();
//  all_on(255);
  
}

void fill_rect_1(int RED, int GREEN, int BLUE){
  int rect_x_1 = green_x_loc-8;
  int rect_y_1 = blue_y_loc+335;
  rect(rect_x_1,rect_y_1,30,30);
  fill(color(RED,GREEN,BLUE));
}
void fill_rect_2(int RED, int GREEN, int BLUE){
  int rect_x_2 = green_x_loc-8+2*space_between+space_between*2;
  int rect_y_2 = blue_y_loc+335;
  rect(rect_x_2,rect_y_2,30,30);
  fill(color(RED,GREEN,BLUE));
}
void fill_rect_3(int RED, int GREEN, int BLUE){
  int rect_x_3 = green_x_loc-8+2*space_between+space_between*6;
  int rect_y_3 = blue_y_loc+335;
  rect(rect_x_3,rect_y_3,30,30);
  fill(color(RED,GREEN,BLUE));
}
void fill_rect_4(int RED, int GREEN, int BLUE){
  int rect_x_4 = green_x_loc-8+2*space_between+space_between*10;
  int rect_y_4 = blue_y_loc+335;
  rect(rect_x_4,rect_y_4,30,30);
  fill(color(RED,GREEN,BLUE));
}
void fill_rect_5(int RED, int GREEN, int BLUE){
  int rect_x_5 = green_x_loc-8+2*space_between+space_between*14;
  int rect_y_5 = blue_y_loc+335;
  rect(rect_x_5,rect_y_5,30,30);
  fill(color(RED,GREEN,BLUE));
}
void fill_rect_6(int RED, int GREEN, int BLUE){
  int rect_x_6 = green_x_loc-8+2*space_between+space_between*18;
  int rect_y_6 = blue_y_loc+335;
  rect(rect_x_6,rect_y_6,30,30);
  fill(color(RED,GREEN,BLUE));
}
void rainbow(){
  RED = 255;
  GREEN = 0;
  BLUE = 0;
  
  RED_2 = 255;
  GREEN_2 = 127;
  BLUE_2 = 0;
  
  RED_3 = 255;
  GREEN_3 = 255;
  BLUE_3 = 0;
  
  RED_4 = 0;
  GREEN_4 = 255;
  BLUE_4 = 0;
  
  RED_5 = 0;
  GREEN_5 = 0;
  BLUE_5 = 255;
  
  RED_6 = 255;
  GREEN_6 = 0;
  BLUE_6 = 255;
}

void half_off(){
  RED = 127;
  GREEN = 127;
  BLUE = 127;
  
  RED_2 = 0;
  GREEN_2 = 0;
  BLUE_2 = 0;
  
  RED_3 = 127;
  GREEN_3 = 127;
  BLUE_3 = 127;
  
  RED_4 = 0;
  GREEN_4 = 0;
  BLUE_4 = 0;
  
  RED_5 = 127;
  GREEN_5 = 127;
  BLUE_5 = 127;
  
  RED_6 = 0;
  GREEN_6 = 0;
  BLUE_6 = 0;
}

void outer_two_on(){
  RED = 127;
  GREEN = 127;
  BLUE = 127;
  
  RED_2 = 0;
  GREEN_2 = 0;
  BLUE_2 = 0;
  
  RED_3 = 0;
  GREEN_3 = 0;
  BLUE_3 = 0;
  
  RED_4 = 0;
  GREEN_4 = 0;
  BLUE_4 = 0;
  
  RED_5 = 0;
  GREEN_5 = 0;
  BLUE_5 = 0;
  
  RED_6 = 127;
  GREEN_6 = 127;
  BLUE_6 = 127;
}

void all_on(int val){
  RED = val;
  GREEN = val;
  BLUE = val;
  
  RED_2 = val;
  GREEN_2 = val;
  BLUE_2 = val;
  
  RED_3 = val;
  GREEN_3 = val;
  BLUE_3 = val;
  
  RED_4 = val;
  GREEN_4 = val;
  BLUE_4 = val;
  
  RED_5 = val;
  GREEN_5 = val;
  BLUE_5 = val;
  
  RED_6 = val;
  GREEN_6 = val;
  BLUE_6 = val;
}

void cycle(){
 for(int j=0; j<=512; j++){
  dmxOutput.set(j,255);
  delay(1000);
  dmxOutput.set(j,0);
} 
}
