precision highp float;

attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec3 aNormal;

uniform float uMouse;
uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;
uniform float uTime;

varying vec3 vNormal;

void main() {
    vNormal = aNormal;

    vec4 positionVec4 = vec4(aPosition, 1.0);

    float frequency = uMouse;
    float amplitude = 0.2;

    float distortionX = sin(positionVec4.x * frequency + uTime * 0.01);
    positionVec4.x += distortionX * aNormal.x * amplitude;
    float distortionY = cos(positionVec4.y * frequency + uTime * 0.01);
    positionVec4.y += distortionY * aNormal.y * amplitude;
    float distortionZ = sin(positionVec4.z * frequency + uTime * 0.01);
    positionVec4.z += distortionZ * aNormal.z * amplitude;

    gl_Position = uProjectionMatrix * uModelViewMatrix * positionVec4;
}