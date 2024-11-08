conan install . --output-folder=cmake-build-debug --build=missing --settings=build_type=Debug
#cmake -G "Ninja" -S . -B cmake-build-debug -DCMAKE_TOOLCHAIN_FILE=/home/thiago/src/my-project/build/build/Debug/generators/conan_toolchain.cmake -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_BUILD_TYPE=Debug
