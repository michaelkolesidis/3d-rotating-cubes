Cube cube;
Cube cube_small;

void setup() {
  size(1200, 1200, P3D);
  frameRate(60);
  cube = new Cube(width/2, height/2, 0, 0.01, 100);
  cube_small = new Cube(300, 300, -100, 0.01, 50);
}
void draw() {
  background(255);
  //cube.rotate();
  cube.rotateMouse();
  cube.display();
  cube_small.rotate();
  //cube_small.rotateMouse();
  cube_small.display();
}
