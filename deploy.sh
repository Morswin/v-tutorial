#!/usr/bin/env bash
set -e

# 1. Upewnij się, że folder build istnieje
mkdir -p build

# 2. Wygeneruj pliki budowania (jeśli to konieczne)
cmake -S . -B build

# 3. Zbuduj projekt w folderze build
cmake --build build

echo "=== Zbudowano pomyślnie! Uruchamianie... ==="

cd build/
./app