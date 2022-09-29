import controlP5.*;
import java.util.*;
import processing.sound.*;
  
//SoundFile file;

ControlP5 cp5;

boolean help = false;
Textlabel helpLabel;
Textlabel alarmLabel;
Textlabel openLabel;
Textlabel closeLabel;

Textlabel FLOORLabel;


//String audioName = "alarmsound.mp3";
String path;

Toggle tog1;
Toggle tog2;
Toggle tog3;
Toggle togvoiceact;
Toggle tog5;
Toggle tog6;
//Toggle togopen;
//Toggle togclose;
//Toggle toghelp;
Toggle togalarm;

Timer time = new Timer();

void setup() {
   size(600, 1300);
   cp5 = new ControlP5(this);
   
    tog2 = cp5.addToggle("toggle 2")
   .setPosition(250,400)
   .setImages(loadImage("2.png"), loadImage("2.png"), loadImage("2light.png"))
   .updateSize()
   .setState(false);
   
    togvoiceact = cp5.addToggle("togglevoiceact")
   .setPosition(50, 480)
   .setImages(loadImage("voiceacti.png"), loadImage("voiceacti.png"), loadImage("voiceactilight.png"))
   .updateSize()
   .setState(false);
   
   tog1 = cp5.addToggle("toggle 1")
   .setPosition(250, 550)
   .setImages(loadImage("1.png"), loadImage("1.png"), loadImage("1light.png"))
   .updateSize()
   .setState(false);  

   

  
   cp5.addButton("openButton")
   .setPosition(175, 700)
   .setImages(loadImage("open.png"), loadImage("open.png"), loadImage("openlight.png"))
   .updateSize();   
   
   openLabel = cp5.addTextlabel("open label")
   .setText("OPEN DOOR")
   .setColorValue(0)
   .setFont(createFont("FFScala", 15))
   .setPosition(175, 810);
  
   cp5.addButton("closeButton")
   .setPosition(325, 700)
   .setImages(loadImage("close.png"), loadImage("close.png"), loadImage("closelight.png"))
   .updateSize();
   
   closeLabel = cp5.addTextlabel("close label")
   .setText("CLOSE DOOR")
   .setColorValue(0)
   .setFont(createFont("FFScala", 15))
   .setPosition(325, 810);
   
   

   
   cp5.addButton("helpButton")
   .setPosition(120, 950)
   .setImages(loadImage("phone.png"), loadImage("phone.png"), loadImage("phonelight.png"))
   .updateSize();
   
   helpLabel = cp5.addTextlabel("help label")
   .setText("  WHEN FLASHING\n\n\nHELP IS ON THE WAY")
   .setColorValue(0)
   .setFont(createFont("FFScala", 15))
   .setPosition(90, 1050);
   
   
   togalarm = cp5.addToggle("togglealarm")
   .setPosition(400, 950)
   .setImages(loadImage("redalarm.png"), loadImage("redalarm.png"), loadImage("redalarmlight.png"))
   .updateSize()
   .setState(false);
   
   alarmLabel = cp5.addTextlabel("alarm label")
   .setText("ALARM")
   .setColorValue(color(255, 0, 0))
   .setFont(createFont("FFScala", 15))
   .setPosition(420, 1050);
   
   
   //////////////////////////////////////////////////////
   FLOORLabel = cp5.addTextlabel("FLOOR label")
   .setText("FLOOR")
   .setColorValue(0)
   .setFont(createFont("FFScala", 50))
   .setPosition(200, 50);

   //path = sketchPath(audioName);
   //file = new SoundFile(this, path);
}

void draw() {
  PImage img;
  img = loadImage("ssbf.jpg");
  background(img);
  
  circle(170, 1084, 20);
  if (help == false) {
    fill(0);
  }
  if (help == true) {
    if(frameCount % 5 == 0) {
      fill(0);
      delay(250);
    }
    else {
      fill(255, 234, 0);
      delay(250);
    }
  }
  if(tog1.getState() == true ) {
    
    text("1", 280, 150);
    delay(3000);
    off();
  }
    if(tog2.getState() == true) {
    text("2", 280, 150);
    delay(3000);
    off();
  }
  
  
  //  if(tog1.getState() == true | tog2.getState() == true | togvoiceact.getState() == true) {
  //  text("alarm on", 210, 50);
  //  off();
  //}
  
  if(togalarm.getState() == true) {
    //file.play(); 
    text("alarm on", 210, 50);
    delay(3000);
    //alarmsound();
    togalarm.setState(false);
    
    //delay(3000);
    
  }
}

void alarmsound() {
  //file.stop();
}

void helpButton() {
  help = true;
}

void mousePressed() {
  help = false;
}

void off() {
  if (tog1.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog1.setState(false);        
      }
    }, 5000);
  }
  if (tog2.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        tog2.setState(false);
      }
    }, 5000);
  }
  
  if (togvoiceact.getState() == true) {
    time.schedule(new TimerTask() {
      public void run() {
        togvoiceact.setState(false);
      }
    }, 5000);
  }

}
