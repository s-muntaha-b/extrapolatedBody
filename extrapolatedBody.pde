PVector cameraPos;

void setup() {
  size(1000, 1000, P3D);
  cameraPos = new PVector(height, 0, 100);
  setupCapture(0);
  setupOpenCV();
}

void draw() {
  scale(3);
  background(190,390,232);
  updateOpenCV();
  
  image(buffer, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);

  for (int i=0; i<faces.length; i++) {
    Rectangle face = faces[i];
    if (i == 0) {
      cameraPos.x = face.x - width/2;
    }
    rect(face.x, face.y, face.width, face.height);
  }

  pushMatrix();    
  camera(cameraPos.x, cameraPos.y, cameraPos.z, 0, 0, 0, 0, -1, 0);
  
  fill(120, 60, 255);
  stroke(0);
  strokeWeight(1);
  box(25);

  popMatrix();
  
  surface.setTitle("" + frameRate);
}

float rotation=0;
