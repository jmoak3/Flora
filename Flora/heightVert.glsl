uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;
uniform vec4 lightPosition;
uniform sampler2D texture;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;
varying vec4 vertPosition;

void main() {
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
  vec4 pos = position;
  pos.y = (1-texture2D(texture, vertTexCoord.st).r)*30;
  gl_Position = transform * pos;
  vec3 ecPosition = vec3(modelview * position);

  ecNormal = normalize(normalMatrix * normal);
  lightDir = normalize(lightPosition.xyz - ecPosition);
  vertColor = color;

}
