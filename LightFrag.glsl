
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  vec3 normal = normalize(vertNormal);
  vec3 lightDir = normalize(vertLightDir);
  float intensity = max(0.0, dot(lightDir, normal));
  vec4 light = vec4(intensity, intensity, intensity,1.0);
  gl_FragColor = light * vertColor;
}
