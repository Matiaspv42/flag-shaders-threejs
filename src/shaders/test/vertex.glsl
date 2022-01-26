uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;
// attribute float aRandom;

// varying float vRandom;
attribute vec2 uv;

// send uv coordinates to fragment

varying vec2 vUv;
varying float vElevation;

uniform vec2 uFrequency;
uniform float uTime;

void main()
{
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    // we can separate all the transformations to have more control and we can modify them 

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.x - uTime) * 0.1;

    modelPosition.z += elevation;


    // this is for the random
    // modelPosition.z += aRandom * 0.1;
    
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // vRandom = aRandom;

    vUv = uv;

    vElevation = elevation;
}
