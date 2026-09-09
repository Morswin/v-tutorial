#version 450

// Dane wejściowe odebrane z Vertex Shadera (zwirtualizowane i uśrednione dla każdego piksela!)
layout(location = 0) in vec3 fragColor;

// Dane wyjściowe - ostateczny kolor piksela wysyłany do bufora ramki (RGBA)
layout(location = 0) out vec4 outColor;

void main() {
    outColor = vec4(fragColor, 1.0); // Przekazujemy kolor RGB + kanał Alpha = 1.0 (pełna nieprzezroczystość)
}