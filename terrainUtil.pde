float terrainWidth = 1000;
float terrainDepth = 1000;
int subdivs = 500;

PShape createTerrain() {
  heightShader = loadShader("heightFrag.glsl", "heightVert.glsl");
  PShape t = createShape();
  t.beginShape(QUADS);
  t.noStroke();
  t.noFill();
  t.tint(color(70, 200, 70));
  t.texture(heightMap);
  t.normal(0.0, 1.0, 0.0);
  
  float w = terrainWidth;
  float z = terrainDepth;
  float subW = w/subdivs;
  float subZ = z/subdivs;
  for (int i=0;i<subdivs;++i) {
    for (int j=0;j<subdivs;++j) {
      t.vertex(-w*0.5f + (i+1)*subW, 0, -z*0.5f + j*subZ, (float)(i+1)/(float)(subdivs), (float)(j)/(float)(subdivs));
      t.vertex(-w*0.5f + (i+1)*subW, 0, -z*0.5f + (j+1)*subZ, (float)(i+1)/(float)(subdivs), (float)(j+1)/(float)(subdivs));
      t.vertex(-w*0.5f + i*subW, 0, -z*0.5f + (j+1)*subZ, (float)(i)/(float)(subdivs), (float)(j+1)/(float)(subdivs));
      t.vertex(-w*0.5f + i*subW, 0, -z*0.5f + j*subZ, (float)(i)/(float)(subdivs), (float)(j)/(float)(subdivs));   
    }
  }
  t.endShape();
  
  return t;
}

void updateTerrain() {
  shader(heightShader);
  heightShader.set("terrainWidth", terrainWidth);
  heightShader.set("terrainDepth", terrainDepth);
  heightShader.set("subdivs", subdivs);
  
  pushMatrix();
    //rotateZ(PI);
    shape(terrain);
  popMatrix();
}