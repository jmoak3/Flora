float teapotSpeed = -50;
float xPosss = 200;
float yPosss = -200;

void updateTeapot() {  
  shader(diffuseShader);
  
  teapot.setFill(color(255, 0, 0));
  xPosss += teapotSpeed*dt;
  pushMatrix();
    translate(xPosss, yPosss,0);
    rotateX(PI/2);
    shape(teapot, 0, 0);
  popMatrix();
  
}