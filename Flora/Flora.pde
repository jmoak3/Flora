
//**************************** global variables ****************************
float t=1, f=0;
PShape teapot;
PShape terrain;
PShader heightShader;
PShader diffuseShader;
PImage heightMap;

boolean leftHeld = false;
boolean rightHeld = false;
boolean mouseHeld = false;

int lastMX = 0;
int lastMY = 0;
int offsetMX = 0;
int offsetMY = 0;
int offsetMZ = 300;

float dt = 0.0;
long lastTime = 0;

//****************************   initialization ****************************
void setup() {               // executed once at the begining 
  textureMode(NORMAL);
  size(600,600, P3D);            // window size
  frameRate(30);             // render 30 frames per second
  smooth();                  // turn on antialiasing
  
  heightMap = loadImage("heightmap.png");
  diffuseShader = loadShader("LightFrag.glsl", "LightVert.glsl");
  heightShader = loadShader("heightFrag.glsl", "heightVert.glsl");
  teapot = loadShape("Teapot.obj");
  terrain = createTerrain();
}

//**************************** display current frame ****************************
void draw() {      // executed at each frame
  dt = ((float)(millis() - lastTime)) / 1000.0;
  lastTime = millis();
  background(color(100, 180, 255));
  updateCamera();
  pointLight(255,255,255, 200, -1000, 20);
  updateTerrain();
  //updateTeapot();
}  

//**************************** user actions ****************************
void keyPressed() { 
  
  if (key == CODED) {
    if(keyCode==LEFT) leftHeld = true;
    if(keyCode==RIGHT) rightHeld = true;
  }
  if(key=='q') exit();  // quit application
}

void keyReleased() { 
  if (key == CODED) {
    if(keyCode==LEFT) leftHeld = false;
    if(keyCode==RIGHT) rightHeld = false;
  }
}

void mousePressed() {
  mouseHeld = true;
  lastMX = mouseX - offsetMX; 
  lastMY = mouseY - offsetMY;
}

void mouseDragged() {
  if(mouseHeld) {
    offsetMX = mouseX - lastMX; 
    offsetMY = mouseY - lastMY;
  }
}

void mouseReleased() {
  mouseHeld = false;
  offsetMX = mouseX - lastMX; 
  offsetMY = mouseY - lastMY;  
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  offsetMZ += e*20;  
}