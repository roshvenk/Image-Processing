ArrayList<sphere> spheres = new ArrayList<sphere>();

void setup() {
  size(640, 640 ,P3D);
  
}

class sphere
{
  int xCoordinate;
  int yCoordinate;
  int zPos;
  
  int xSpeed;
  int ySpeed;
  int zSpeed;
  
  int xAnglerotation;
  int yAnglerotation;
  int zAnglerotation;
  
  int imgnum;
  
  sphere(int xCoordinate, int yCoordinate, int zPos, int xSpeed, int ySpeed, int zSpeed, int xAnglerotation, int yAnglerotation, int zAnglerotation, int imgnum)
  {
    this.xCoordinate = xCoordinate;
    this.yCoordinate = yCoordinate;
    this.zPos = zPos;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.zSpeed = zSpeed;
    this.xAnglerotation = xAnglerotation;
    this.yAnglerotation = yAnglerotation;
    this.zAnglerotation = zAnglerotation;
    this.imgnum = imgnum;
  }
}

void mousePressed() {
  spheres.add(new sphere(mouseX, mouseY,  -600,  int(random(-10, 30)), int(random(-10, 30)), int(random(-30, 30)), int(random(50,200)), int(random(50,200)), int(random(50,200)),  int(random(0,3))));
}



void rotate(PShape sphere, int i){
        if ( spheres.get(i).xCoordinate > 0) {
        
            spheres.get(i).xAnglerotation = (spheres.get(i).xAnglerotation + 5) ;
        }
        else if ( spheres.get(i).xCoordinate <=  0){
             spheres.get(i).xAnglerotation = (spheres.get(i).xAnglerotation- 5) ;
          }
        if ( spheres.get(i).yCoordinate > 0) {
        
            spheres.get(i).yAnglerotation = (spheres.get(i).yAnglerotation + 5) ;
        }
        else if ( spheres.get(i).yCoordinate <= 0){
             spheres.get(i).yAnglerotation = (spheres.get(i).yAnglerotation- 5) ;
          }
          
          if ( spheres.get(i).zPos > 0) {
        
            spheres.get(i).zAnglerotation = (spheres.get(i).zAnglerotation + 5) ;
        }
          else if ( spheres.get(i).zPos <= 0){
             spheres.get(i).zAnglerotation = (spheres.get(i).zAnglerotation- 5) ;
          }
          
          sphere.rotateX(radians(spheres.get(i).xAnglerotation));
          sphere.rotateY(radians(spheres.get(i).yAnglerotation));
          sphere.rotateZ(radians(spheres.get(i).zAnglerotation));  
}





void draw() { 
  lights();
 
  background(0);
  stroke(255);
  noFill();
  line(width, height, -600, width, 0, -600);
  line(width, 0, -600, width, 0, 0);
  line(0, height, -600, 0, height, 0);
  line(width, height, -600, width, height, 0);
  
  line(0, 0, -600, 0, 0, 0);
  line(0, 0, -600, width, 0, -600);
  line(0, 0, -600, 0, height, -600);
  line(0, height, -600, width, height, -600);
 
  
  
  for (int i = 0; i < spheres.size(); i++) {
    
      pushMatrix();
      noStroke();
      
      if (spheres.get(i).zPos <= -600) {
        spheres.get(i).zPos = -600;
        spheres.get(i).zSpeed *= -1;
      }
      if (spheres.get(i).yCoordinate >= height) {
      
        spheres.get(i).yCoordinate = height;
        spheres.get(i).ySpeed *= -1;
      }
      
      if (spheres.get(i).xCoordinate <= 0) {
    
        spheres.get(i).xCoordinate = 0;
        spheres.get(i).xSpeed *= -1;
      }
      if (spheres.get(i).xCoordinate >= width) {
        spheres.get(i).xCoordinate = width;
        spheres.get(i).xSpeed *= -1;
      }
      
      spheres.get(i).ySpeed = spheres.get(i).ySpeed + 20;
      
      
      PShape sphere = createShape(SPHERE, 20);
      int texturenum = spheres.get(i).imgnum;
      PImage img = loadImage("Prisonschool.jpg");
      if (texturenum == 1){
        img = loadImage("Face.jpg");
      }
      else if (texturenum == 2){
        img = loadImage("Face1.jpg");
      }
      translate(spheres.get(i).xCoordinate, spheres.get(i).yCoordinate, spheres.get(i).zPos);
      sphere.setTexture(img);
      rotate(sphere, i);
      hitEachOther(i);
      shape(sphere);
      
      spheres.get(i).xCoordinate += spheres.get(i).xSpeed;
      spheres.get(i).yCoordinate += spheres.get(i).ySpeed;

      spheres.get(i).zPos += spheres.get(i).zSpeed;
      
      popMatrix();
      
      
    }
  }

void hitEachOther(int i) {
  for (int k = i + 1; k < spheres.size(); k++) {
    float distancebetween = getDistance(spheres.get(i).xCoordinate,spheres.get(k).xCoordinate,spheres.get(i).yCoordinate,spheres.get(k).yCoordinate,spheres.get(i).zPos,spheres.get(k).zPos);
    if (distancebetween <= 60) {
        int tempSpeedx = spheres.get(i).xSpeed;
        spheres.get(i).xSpeed = spheres.get(k).xSpeed;
        spheres.get(k).xSpeed = tempSpeedx;
        
        int tempSpeedy = spheres.get(i).ySpeed;
        spheres.get(i).ySpeed = spheres.get(k).ySpeed;
        spheres.get(k).ySpeed = tempSpeedy;
        
        int tempSpeedz = spheres.get(i).zSpeed;
        spheres.get(i).zSpeed = spheres.get(k).zSpeed;
        spheres.get(k).zSpeed = tempSpeedz;
    }
  }
}

float getDistance(int xCoordinate1, int xCoordinate2, int yCoordinate1, int yCoordinate2, int zPos1, int zPos2){
 return sqrt( pow(xCoordinate1 -xCoordinate2, 2) + pow(yCoordinate1 - yCoordinate2, 2) + pow(zPos1 -zPos2, 2));
}
