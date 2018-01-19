uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;
uniform vec4 lightPosition;
uniform sampler2D texture;
uniform int subdivs;
uniform float terrainWidth;
uniform float terrainDepth;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;
varying vec4 vertPosition;

float height(float currHeight, vec2 param) {
	return currHeight - (1.0-texture2D(texture, param.xy).r)*50.0;
}

float height(vec3 pos) {
	vec2 param = vertTexCoord.st;
	param.x = param.x + (pos.x - position.x)/terrainWidth;
	param.y = param.y + (pos.z - position.z)/terrainDepth;
	return height(pos.y, param);
}

vec3 calcNormal(vec3 alteredPos, vec2 offVec) {
  vec3 a = position.xyz; a.x = a.x + offVec.x;
  vec3 b = position.xyz; b.z = b.z + offVec.y;
  a.y = height(a);
  b.y = height(b);
  vec3 v1 = a.xyz - alteredPos.xyz;
  vec3 v2 = b.xyz - alteredPos.xyz;

  return normalize(cross(v1,v2));
}

vec3 calcNormal(vec3 alteredPos) {
  float offset = 0.01;
  vec2 off1 = normalize(vec2(offset, offset));
  vec2 off2 = normalize(vec2(-offset, -offset));
  vec2 off3 = normalize(vec2(-offset, offset));
  vec2 off4 = normalize(vec2(offset, -offset));
  vec3 avgNormal = (calcNormal(alteredPos, off1) 
                   + calcNormal(alteredPos, off2));
  avgNormal = avgNormal*0.25;
  return normalize(avgNormal);
}

void main() {
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
  vec4 alteredPos = position;
  alteredPos.y = height(alteredPos.xyz);

  gl_Position = transform * alteredPos;
  vec3 ecPosition = vec3(modelview * alteredPos);

  vec3 trueNormal = calcNormal(alteredPos.xyz);
  vertNormal = normalize(normalMatrix * trueNormal);
  lightDir = normalize(lightPosition.xyz - ecPosition);

  vertColor = color;
}
