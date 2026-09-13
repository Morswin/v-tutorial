#version 450

layout(location = 0) in vec2 inPosition;
layout(location = 1) in vec3 inColor;

layout(location = 0) out vec2 fragUV;

layout(push_constant) uniform PushConstants {
    mat4 renderMatrix;
    vec4 color;
    vec4 rextParams;
    vec4 borderColor;
} push;

void main() {
    gl_Position = push.renderMatrix * vec4(inPosition, 0.0, 1.0);
    // fragColor = inColor;
    fragUV = inPosition;
}