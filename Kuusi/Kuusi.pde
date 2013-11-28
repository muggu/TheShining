void setup() {
size(640, 560, P3D);
}

void draw() {
background(0);
lights();
translate(width / 2, height / 2);
// rotateY(map(mouseX, 0, width, 0, PI));
// rotateZ(map(mouseY, 0, height, 0, -PI));
noStroke();
fill(255, 255, 255);
perspective(PI/3.0, float(width)/float(height), 1, 10000);
camera( 0, mouseY, mouseY+ 600, // eyeX, eyeY, eyeZ
0, 0, 50, // centerX, centerY, centerZ
0.0, 0.0, 90.0); // upX, upY, upZ
rotateY( mouseX / 100.0 );

translate(0, -40, 0);
drawCylinder(66, 1, 150, 6); // Draw a mix between a cylinder and a cone
drawCylinder(40, 80, -85, 6); // Draw a cylinder
drawCylinder(7, 100, -200, 6); // Draw a pyramid
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
float angle = 0;
float angleIncrement = TWO_PI / sides;
beginShape(QUAD_STRIP);
for (int i = 0; i < sides + 1; ++i) {
vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
angle += angleIncrement;
}
endShape();

// If it is not a cone, draw the circular top cap
if (topRadius != 0) {
  angle = 0;
  beginShape(TRIANGLE_FAN);

// Center point
vertex(0, 0, 0);
for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
    angle += angleIncrement;
}
  endShape();
}

// If it is not a cone, draw the circular bottom cap
if (bottomRadius != 0) {
  angle = 0;
  beginShape(TRIANGLE_FAN);

// Center point
  vertex(0, tall, 0);
  for (int i = 0; i < sides + 1; i++) {
    vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
    angle += angleIncrement;
}
  endShape();
}
}

