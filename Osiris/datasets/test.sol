pragma solidity ^0.4.13;

contract demo {
    function fun1(uint a1,uint b1) {
                            ///3.将这之间的变量变化分析出来，将a3,b3用a1,b1表示
                            ///表示完成之后得到Path_Final
        uint a;
        uint b;

        Private_Bug(a,b); ///2.由于Pri是私有函数，外部不能直接调用，
                            ///所以要通过CFG图找到其入口函数fun1
                            ///并将Path_Private用fun1()的变量a1,b1表示
        Public_Bug(a,b);

        fun2(a,b);
    }
    function fun2(uint a2,uint b2) {
        uint x;
        uint y;
        Public_Bug(x,y);
    }
    function Private_Bug(uint a3,uint b3) { ///1.Osiris生成路径约束Path_Private

    }
    function Public_Bug(uint a4,uint b4) { ///Osiris生成路径约束Path_Public

    }
}

///4.Path_Final作为最后输入过滤器中的一个if语句，用于判断执行fun1是否会触发Pri_Bug()的漏洞

///5.若针对公有函数Public_Bug()，情况则更复杂：
///首先，它有三个入口点，四个调用途径：
///Public_Bug()，对应的if语句是Path_Public
///fun2()->Public_Bug()，需要将Path_Public中的a4,b4用fun2()中参数a2,b2表示
///fun1()->Public_Bug()，需要将Path_Public中的a4,b4用fun1()中参数a1,b1表示
///fun1()->fun2()->Public_Bug()，需要将Path_Public中的a4,b4先用fun2()中参数a2,b2表示
///                              再将a2,b2用a1,b1表示
///即：每一个公有函数均是入口点。
