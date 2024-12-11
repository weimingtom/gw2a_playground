# gw2a_playground
[WIP] My GW2A CPLD/FPGA/verilog playground

## (TODO) Basys3 snake and other games (search csdn download)   

## Gowin IDE and Programmer  
* (x) Gowin_V1.9.8.11_Education_win.zip  
* Gowin_V1.9.9Beta-4_Education_win.zip  
* Gowin_V1.9.9_x64_win.zip  
* nestang_install.7z/TangNano-20K-example-main_mod.7z  

## 从CPU到SoC的设计与实现 基于高云云源软件和FPGA硬件平台  
```
我实际测试过《从CPU到SoC的设计及实现》这本书中提到的高云IDE编译MIPS的单周期多周期流水线实现，
大概需要1.6K（或2.3K左右）个LUT逻辑单元，也就是说大部分高云开发板应该都能跑（虽然需要比较多的引脚）
```

## apple1_on_anlogic  
* https://gitee.com/pan-xingyu/apple1_on_anlogic
* https://www.bilibili.com/video/BV1db4y1p7jD/

## quartus12_copy  
```
实际用了一下高云的IDE综合器编译自己写（借鉴）的代码，
它和Quartus12基本上是一样的（不考虑什么针脚设计，
就简单的verilog和VHDL），除了VHDL语法会有一点细微的区别：
VHDL似乎遇到端口映射port map语句的时候会提示没有这个组件，
需要在实体名前面加上entity才不会出现语法错误，
但我查过书，其实不加entity也是对的
```
