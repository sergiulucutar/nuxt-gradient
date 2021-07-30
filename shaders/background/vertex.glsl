precision mediump float;

attribute vec2 aVertexPosition;
attribute vec2 aUvs;

uniform mat3 translationMatrix;
uniform mat3 projectionMatrix;

uniform float uTime;

varying vec2 vPosition;
varying vec2 mainRotation;
varying vec2 secondaryRotation;
varying vec2 movingPointSecondary;

void main() {
  gl_Position = vec4((projectionMatrix * translationMatrix * vec3(aVertexPosition, 1.0)).xy, 0.0, 1.0);
  vPosition = gl_Position.xy;

  mainRotation = vec2(cos(2.0 * 3.14 * uTime), sin(2.0 * 3.14 * uTime));
  secondaryRotation = vec2(cos(2.0 * 3.14 * (uTime-0.05)), sin(2.0 * 3.14 * (uTime-0.05)));
  movingPointSecondary = mainRotation * -1.0;
}