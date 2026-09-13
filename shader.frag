#version 450

layout(location = 0) in vec2 fragUV;
layout(location = 0) out vec4 outColor;

layout(push_constant) uniform PushConstants {
    mat4 renderMatrix;
    vec4 color;
    vec4 rectParams; // x: width, y: height, z: cornerRadius, w: borderWidth
    vec4 borderColor;
} push;

float sdRoundedBox(vec2 p, vec2 b, float r) {
    vec2 q = abs(p) - b + vec2(r);
    return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
}

void main() {
    vec2 size = push.rectParams.xy;
    float radius = push.rectParams.z;
    float borderWidth = push.rectParams.w;

    vec2 pixelPos = (fragUV - 0.5) * size;
    vec2 halfSize = size * 0.5;

    float dist = sdRoundedBox(pixelPos, halfSize, radius);

    float smoothedAlpha = 1.0 - smoothstep(-1.0, 0.0, dist);

    if (smoothedAlpha <= 0.0) {
        discard;
    }

    if (borderWidth >= 0.0) {
        float borderFactor = smoothstep(-borderWidth - 1.0, -borderWidth, dist);
        outColor = mix(push.color, push.borderColor, borderFactor);
    } else {
        outColor = push.color;
    }

    outColor.a = smoothedAlpha;
}