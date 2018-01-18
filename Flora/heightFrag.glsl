#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;
varying vec4 vertPosition;

float random( vec2 p )
{
    vec2 K1 = vec2(
        23.14069263277926, // e^pi (Gelfond's constant)
         2.665144142690225 // 2^sqrt(2) (Gelfondâ€“Schneider constant)
    );
    return fract( cos( dot(p,K1) ) * 12345.6789 );
}

void main() {
  vec3 direction = normalize(lightDir);
  vec3 normal = normalize(ecNormal);
  float intensity = max(0.0, dot(direction, normal)); 
  float noiseX = random(vertPosition.xz)*0.25;
  float noiseY = random(vertPosition.yx)*0.25;
  float noiseZ = random(vertPosition.zx)*0.25;
  vec4 green = vec4(0.2+noiseX, 0.65+noiseY, 0.2+noiseZ, 1.0);
  vec4 tintColor = green * vec4(intensity, intensity, intensity, 1);
  gl_FragColor = tintColor;
}
