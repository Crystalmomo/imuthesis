//这是一段示例代码
//在代码中可以用插入/*#/*\#\tbs makeremark\{注释内容\}\#*/#*/来添加一个额外的注释，例如下面第4行代码
//所添加的额外注释会在添加处显示一个标号。
#include <iostream>

int main(int argc, char* argv[]/*#\makeremark{argv是各个参数值，它是一个字符串数组}#*/){
    std::cout<<"Hello LaTeX!"<<std::endl/*#\makeremark{使用std::是因为没有打开std命名空间}#*/;
    return 0;
}