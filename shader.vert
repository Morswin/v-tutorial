#version 450

// Współrzędne 3 wierzchołków trójkąta w przestrzeni NDC (Normalized Device Coordinates)
// -1.0 to lewa/góra, 1.0 to prawa/dół
vec2 positions[3] = vec2[](
    vec2(0.0, -0.5),  // Wierzchołek 1: Góra (środek)
    vec2(0.5, 0.5),   // Wierzchołek 2: Prawy dół
    vec2(-0.5, 0.5)   // Wierzchołek 3: Lewy dół
);

// Kolory przypisane do odpowiednich wierzchołków (RGB)
vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0), // Czerwony
    vec3(0.0, 1.0, 0.0), // Zielony
    vec3(0.0, 0.0, 1.0)  // Niebieski
);

// Dane wyjściowe przekazywane automatycznie do Fragment Shadera
layout(location = 0) out vec3 fragColor;

void main() {
    // gl_VertexIndex to wbudowana zmienna określająca numer obecnie przetwarzanego wierzchołka (0, 1 lub 2)
    gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}