import os

from conan import ConanFile
from conan.cli.commands.build import build
from conan.tools.build import check_min_cppstd, check_max_cppstd
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout, CMakeDeps


class Project(ConanFile):
    name = "ft_cmp_pr"
    version = "0.1"
    description = "Project aims to check backwards compatibility of Flatbuffers library's binary files"
    topics = ("conan", "package",)
    settings = "os", "compiler", "build_type", "arch"
    options = {
        "old": [True, False],
    }
    default_options = {
        "old": True,
    }

    def requirements(self):
        if self.options.old == True:
            self.requires("flatbuffers/1.12.0")
        else:
            self.requires("flatbuffers/24.3.25")

    requires = [
        "cxxopts/3.2.0"
    ]

    def layout(self):
        cmake_layout(self, generator=["CMakeToolchain", "CMakeDeps"], src_folder='.', build_folder='cmake-build-debug')
        # self.folders.build = "cmake-build-debug"

    def validate(self):
        check_min_cppstd(self, "11")
        check_max_cppstd(self, "20")

    def build_requirements(self):
        self.tool_requires("cmake/3.30.0")

    def configure(self):
        pass

    def generate(self):
        cmake_tc = CMakeToolchain(self, generator="Ninja")
        ##TODO Is not working properly, we need pass this arguments to flatbuffer configure step
        # cmake_tc.variables["FLATBUFFERS_BUILD_TESTS"] = "False"
        # cmake_tc.variables["FLATBUFFERS_BUILD_FLATC"] = "True"
        # cmake_tc.variables["FLATBUFFERS_STATIC_FLATC"] = "False"
        # cmake_tc.variables["FLATBUFFERS_BUILD_FLATHASH"] = "False"
        cmake_tc.cache_variables["OLD"] = "True" if self.options.old else "False"
        cmake_tc.generate()
        deps = CMakeDeps(self)
        deps.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()