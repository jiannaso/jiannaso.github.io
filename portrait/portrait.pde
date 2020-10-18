/* Title: Head in the Clouds
* Author: Jianna So
* Class: ARTSTUDI 162: Embodied Interfaces
*/

/* @pjs preload="me.PNG","small.PNG","medium.PNG","large.PNG"; */

PImage jianna;
float easing = 0.5;
PImage small;
PImage medium;
PImage large;
int thoughtsize;

/* Load images that represent the self portrait,
* the thought backgrounds, and resize each accordingly. 
*/
void setup() {
  size(866, 640);
  background(0);
  jianna = loadImage("me.PNG");
  small = loadImage("small.PNG");
  medium = loadImage("medium.PNG");
  large = loadImage("large.PNG");
  jianna.resize(866, 640);
  small.resize(866, 640);
  medium.resize(866, 640);
  large.resize(866, 640);
  image(jianna, 0, 0);
  thoughtsize = 3;
}

/* Continually draw the background (representing thoughts),
* draw ellipses, and update the background as mouse speed
* changes.
*/
void draw() {
  for (int i = 0; i < 180; i++) {
    float x = random(width);
    float y = random(height);
    
    color c = 0; 
    if(thoughtsize == 1){
        c = small.get(int(x), int(y));
    }
    if(thoughtsize == 2){
        c = medium.get(int(x), int(y));
    }
    if(thoughtsize == 3){
        c = large.get(int(x), int(y));
    }
    fill(c);
    
    noStroke();
    ellipse(x, y, 10, 10);
    variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  }
    image(jianna, 0, 0);
}

/* Draw an ellipse and vary size in accordance with
* mouse speed. 
*/
void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(0);
  noStroke();
  ellipse(x, y, speed, speed);
  check(speed);
}

/* Check speed at which the mouse is moving.
* If speed is above 7, update the background variable.
*/
void check(float speed){
  if(speed > 7) {
    int oldthoughtsize = thoughtsize;
    thoughtsize = (int) random(1,4);
    println(thoughtsize);
    if(thoughtsize == oldthoughtsize) {
      check(speed);
    } else {
      return;
    }
  }  
}
