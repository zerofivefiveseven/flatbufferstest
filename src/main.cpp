//Весь код снизу не используется никак кроме кроме проверки подключения библиотек

#include <iostream>
#include <fstream>
#include "flatbuffers/flatbuffers.h"
#include "cxxopts.hpp"
#include "monster_generated.h"
int main(int argc, char** argv)
{
    flatbuffers::FlatBufferBuilder builder(1024);
    options.add_options()
        ("b,bar", "Param bar", cxxopts::value<std::string>())
        ("d,debug", "Enable debugging", cxxopts::value<bool>()->default_value("false"))
        ("f,foo", "Param foo", cxxopts::value<int>()->default_value("10"))
        ("h,help", "Print usage")
    ;

    auto result = options.parse(argc, argv);

    if (result.count("help"))
    {
        std::cout << options.help() << std::endl;
        exit(0);
    }
    bool debug = result["debug"].as<bool>();
    std::string bar;
    if (result.count("bar"))
        bar = result["bar"].as<std::string>();
    int foo = result["foo"].as<int>();

    return 0;
}