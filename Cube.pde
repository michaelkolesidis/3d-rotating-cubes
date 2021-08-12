class Cube {
  float x, y, z; // x, y, z location
  float thetaX, thetaY, thetaZ;   // angles of rotation
  float speed;   // speed of roation
  float t;       // size of cube

  Cube(float tempX, float tempY, float tempZ, float tempSpeed, float tempT) {
    x = tempX;
    y = tempY;
    z = tempZ;
    thetaX = 0;  // Initial angle of roation is 0
    thetaY = 0;  // Initial angle of roation is 0
    thetaZ = 0;  // Initial angle of roation is 0
    speed = tempSpeed;
    t = tempT;
  }

  void rotateMouse() {
    // Rotate cube according to mouse position
    thetaX = map(mouseX, 0, width, 0, TWO_PI);
    thetaY = map(mouseY, 0, height, 0, TWO_PI);
    thetaZ = map((mouseX+mouseY)/2, 0, (width+height)/2, 0, TWO_PI);
  }

  void rotate() {
    // Increment angle to rotate cube
    thetaX += speed;
    thetaY += speed;
    thetaZ += speed;
  }

  void display() {
    rectMode(CENTER);
    noStroke();

    // Save the transformation state
    pushMatrix();

    translate(x, y, z);

    rotateX(thetaX);
    rotateY(thetaY);
    rotateZ(thetaZ);

    // Draw the sides of the cube and apply color
    beginShape(QUADS);
    // front side
    fill(255, 50, 50, 200);
    vertex(-t, -t, 0);
    vertex(t, -t, 0);
    vertex(t, t, 0);
    vertex(-t, t, 0);

    // right side
    fill(50, 255, 50, 200);
    vertex(t, -t, 0);
    vertex(t, -t, -2*t);
    vertex(t, t, -2*t);
    vertex(t, t, 0);

    // back side
    fill(50, 50, 255, 200);
    vertex(t, -t, -2*t);
    vertex(t, t, -2*t);
    vertex(-t, t, -2*t);
    vertex(-t, -t, -2*t);

    // left side
    fill(255, 255, 50, 200);
    vertex(-t, -t, -2*t);
    vertex(-t, t, -2*t);
    vertex(-t, t, 0);
    vertex(-t, -t, 0);

    // bottom side
    fill(50, 255, 255, 200);
    vertex(-t, t, 0);
    vertex(t, t, 0);
    vertex(t, t, -2*t);
    vertex(-t, t, -2*t);

    // top side
    fill(255, 50, 255, 200);
    vertex(-t, -t, 0);
    vertex(t, -t, 0);
    vertex(t, -t, -2*t);
    vertex(-t, -t, -2*t);
    endShape();

    // Resore the transformation state
    popMatrix();
  }
}
