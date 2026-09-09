{
  description = "Środowisko programistyczne Vulkan w C++";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        cmake
        pkg-config
        shaderc # glslc do kompilacji shaderów
      ];

      buildInputs = with pkgs; [
        vulkan-headers
        vulkan-loader
        vulkan-validation-layers
        glfw
        glm
      ];

      shellHook = ''
        export VK_LAYER_PATH="${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d"
        export LD_LIBRARY_PATH="${pkgs.vulkan-loader}/lib:$LD_LIBRARY_PATH"
        echo "=== Środowisko Vulkan (Flake) gotowe! ==="
      '';
    };
  };
}
