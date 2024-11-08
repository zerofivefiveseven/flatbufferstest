#include <iostream>
#include "monster1.12.0.h"
#include <fstream> // C++ header file for file access
int main()
{
    std::ifstream infile;
    infile.open("monster24.3.25.bin", std::ios::binary | std::ios::in);
    infile.seekg(0,std::ios::end);
    int length = infile.tellg();
    infile.seekg(0,std::ios::beg);
    char *data = new char[length];
    infile.read(data, length);
    infile.close();

    auto monster = MyGame::Sample::GetMonster(data);
    std::cout << "hp : " << monster->hp() << std::endl;              // '80'
    std::cout << "mana : " << monster->mana() << std::endl;          // default value of '150'
    std::cout << "name : " << monster->name()->c_str() << std::endl; // "MyMonster"
}
