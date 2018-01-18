void updateCamera() {
  float rot = -offsetMX/2;
  float radius = offsetMZ;
  float xPos = (sin(radians(rot))*radius);
  float yPos = offsetMY/2;
  float zPos = (cos(radians(rot))*radius);
  camera(xPos, yPos, zPos, 
         0.0, 0.0, 0.0, 
         0.0, 1.0, 0.0);
  print(xPos, yPos, zPos);
  print("\n");
}