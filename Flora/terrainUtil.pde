float terrainWidth = 1000;
float terrainHeight = 1000;


PShape createTerrain() {
  PShape t = createShape();
  t.beginShape(QUADS);
  t.noStroke();
  t.noFill();
  t.texture(heightMap);
  t.normal(0.0, 1.0, 0.0);
  
  float w = terrainWidth;
  float z = terrainHeight;
  int subdivs = 100;
  float subW = w/subdivs;
  float subZ = z/subdivs;
  for (int i=0;i<subdivs;++i) {
    for (int j=0;j<subdivs;++j) {
      t.vertex(-w*0.5f + ((i+1)*subW), 0, z*0.5f - j*subZ, (float)(i+1)/(float)(subdivs), (float)(j)/(float)(subdivs));
      t.vertex(-w*0.5f + ((i+1)*subW), 0, z*0.5f - (j+1)*subZ, (float)(i+1)/(float)(subdivs), (float)(j+1)/(float)(subdivs));
      t.vertex(-w*0.5f + (i*subW), 0, z*0.5f - (j+1)*subZ, (float)(i)/(float)(subdivs), (float)(j+1)/(float)(subdivs));
      t.vertex(-w*0.5f + (i*subW), 0, z*0.5f - (j*subZ), (float)(i)/(float)(subdivs), (float)(j)/(float)(subdivs));   
    }
  }
  t.endShape();
  
  return t;
}

void updateTerrain() {
  shader(heightShader);
  
  pushMatrix();
    rotateZ(PI);
    shape(terrain);
  popMatrix();
  
}