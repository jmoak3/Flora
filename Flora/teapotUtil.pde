float teapotSpeed = 20;
float xPosss = 0;

void updateTeapot() {  
  shader(diffuseShader);
  
  teapot.setFill(color(255, 0, 0));
  xPosss += teapotSpeed*dt;
  pushMatrix();
    rotateX(PI/2);
    translate(xPosss, 0, -20);
    shape(teapot, 0, 0);
  popMatrix();
  
}