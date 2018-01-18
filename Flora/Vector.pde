public class vec3 {
  float x=0.0,y=0.0,z=0.0;
  vec3(float x,float y,float z) {
    this.x=x; this.y=y; this.z=z;
  }
  vec3 cross(vec3 a, vec3 b) {
    return new vec3(a.y*b.z - a.z*b.y, a.z*b.x - a.x*b.z, a.x*b.y - a.y*b.x);  
  }
}

public class vec4 {
  float x=0.0,y=0.0,z=0.0,w=0.0;
  vec4(float x,float y,float z,float w) {
    this.x=x; this.y=y; this.z=z; this.w=w;
  }
}