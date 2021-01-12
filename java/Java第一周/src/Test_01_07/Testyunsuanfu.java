package Test_01_07;

public class Testyunsuanfu {
    public static void main(String[] args) {
        /*
        字符类型：char
        用单引号括起来
        字符只能有一个字母或一个数字或一个中文
         */

        /*
        取模：%
        余数的值是正数还是负数取决于第一个数(被模数)的正数还是负数
        余数的值是整数还是小数取决于第一个数(被模数)的整数还是小数
         */

        /*
        比较运算符：instanceof
        判断对象是否在这个class类名内
        TestDataType ti = new TestDataType();
        System.out.println(ti instanceof TestDataType);
         */

        /*
        逻辑运算符
        &&：且
        短路情况：前面的表达式为false，则整个表达式没必要计算量，其结果为false

        ||：或
        短路情况：前面的表达式为true，则整个表达式没必要计算量，其结果为true
         */

        /*
        位运算符：只对整数类型和char类型有效
        &:与(位运算符与)：将两边换算成二进制进行计算，按位运算，结果转换回来，只有两边运算符结果都为1，其结果为1，否则为0

        |：或(位运算符或)：将两边换算成二进制进行计算，按位运算，结果转换回来，如果有一个为1，结果为1，两边为0，才为0

        ^：异或：将两边换算成二进制进行计算，按位运算，结果转换回来，两边运算不同才为1，相同为0

        <<：向左扩大数值，怎么扩大，移多少位，就乘以2的多少次幂

        >>：向右移缩小数值，怎么缩小，移多少位，就除以2的多少次幂   区分正数和负数

        >>>:无符号右移，跟右移一样，  不区分正数和负数
         */
        t1();
    }

        //课后作业
        public static void t1(){
            int a = 10, b = 20;
            int c = a;
            a = b;
            b = c;
            System.out.println("a:"+ a);
            System.out.println("b:"+ b);
        }


        public static void t2(){
            int d = 345;
            //System.out.println(345%10);
            System.out.println(d/100 + (d/10)%10 + d%10);
        }

        public static void t3(){
            int e,f,g;
            e = 50;
            g = (e-32)*5/9;
            f = g;
            g = f*9/5+32;
            e = g;
            System.out.println(f);
            System.out.println(e);
        }

        public static void t4(){
            char h;
            h = 'A';
            h = (char)(h+32);
            System.out.println(h);
        }


}






