uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  gl_Position = transform * position;
  vec3 vertEye = vec3(modelview*position);
  vertColor = color;
  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = normalize(lightPosition.xyz - vertEye);
}
