precision mediump float;

varying vec2 vPosition;
varying vec2 mainRotation;
varying vec2 secondaryRotation;
varying vec2 movingPointSecondary;

uniform float uIntroTime;
uniform float uResolition;

uniform vec3 uPrimaryColor;
uniform vec3 uSecondaryColor;
uniform vec3 uBackgroundColor;
uniform vec3 uBackgroundLightColor;

void main() {
  vec2 customUv = vec2(vPosition.x, vPosition.y / uResolition);

  float bubblePrimaryStrength = smoothstep(0.1, 0.7, distance(mainRotation, customUv));
  float bubbleSecondaryStrength = smoothstep(0.2, 0.9, distance(secondaryRotation, customUv));
  float spotLightStrength = min(1.0, distance(movingPointSecondary, customUv));

  vec3 secondaryGradient = mix(uSecondaryColor, uBackgroundColor, bubbleSecondaryStrength);
  vec3 primaryGradient = mix(uPrimaryColor, secondaryGradient, bubblePrimaryStrength);
  vec3 finalMix = mix(uBackgroundLightColor, primaryGradient, spotLightStrength);

  gl_FragColor = vec4(mix(finalMix, vec3(1.0), uIntroTime), 1.0);
}
