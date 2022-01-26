precision mediump float;

// varying float vRandom;

uniform vec3 uColor;
uniform sampler2D uTexture;

// receiving the value from vertex

varying vec2 vUv;
varying float vElevation;

void main(){

    vec4 textureColor = texture2D(uTexture, vUv);

    // Changing colors depending on the elevation
    textureColor.rgb *= vElevation * 2.0 + 0.7  ;

     // gl_FragColor = vec4(vRandom,vRandom ,vRandom,vRandom);
    // gl_FragColor = vec4(uColor,1.0);

    gl_FragColor = textureColor;
}