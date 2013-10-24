
void setup(){
size(500, 500);
noStroke();

fill(255,230,0);
triangle(130, 75, 158, 26, 186, 75);
triangle(130, 45, 158, 94, 186, 45); 

fill(0);
ellipse(50, 150, 50, 50);
ellipse(120, 150, 50, 50);
ellipse(85, 190, 80, 80);

smooth();
fill(255,0,0);
beginShape();
vertex(50, 15); 
bezierVertex(50, -5, 90, 5, 50, 40); 
vertex(50, 15); 
bezierVertex(50, -5, 10, 5, 50, 40); 
endShape();


}
