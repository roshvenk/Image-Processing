//import the library required: minim
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
void setup()
{
  size(500, 500);
 
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("../W6LabData/audio_drum.wav");
  song.play();
   //comment it if you do not want to make it loop
}
 
void draw()
{
  background(0); 
  mouseClicked();
}

void mouseClicked() {
  // Submission Info - replace them with your name/unikey
  String studentname = "Roshan Venkatesan";
  String Unikey = "rven8281";
  
  // Enter your code here
  
  if (mousePressed && (mouseButton == LEFT)) {
    song.play();
  } else if (mousePressed && (mouseButton == RIGHT)) {
    song.pause();
  }
  else if  (mousePressed && (mouseButton == CENTER)){
    song.loop();
  }
  }

  
  // Useful page: https://processing.org/reference/mouseButton.html
  
  // Some preseved variable you may want to use: [mouseButton], [LEFT], [RIGHT]
  // Some function that you may want to use: [xx.pause()], [xx.rewind()], [xx.play()]
