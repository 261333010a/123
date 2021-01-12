package Test2;

public class homework {
    public static void main(String[] args) {
        t1();//获取方法t1
        t2();
        t3();
        t4();

    }
        //1、已知a,b均是整型变量，写出将a,b两个变量中的值互换的程序。（知识点：变量和运算符综合应用） [必做题]
    public static void t1(){
            int a = 10, b = 20;
            int c = a;
            a = b;
            b = c;
            System.out.println("a:"+ a);
            System.out.println("b:"+ b);

    }
        //2、给定一个0～1000的整数，求各位数的和，例如345的结果是3+4+5＝12注：分解数字既可以先除后模也可以先模后除（知识点：变量和运算符综合应用） [必做题]
        public static void t2(){
            int d = 345;
            //System.out.println(345%10);
            System.out.println(d/100 + (d/10)%10 + d%10);
        }

        //3、华氏温度和摄氏温度互相转换，从华氏度变成摄氏度你只要减去32，乘以5再除以9就行了，将摄氏度转成华氏度，直接乘以9，除以5，再加上32即行。[选做题]
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

        //4、给定一个任意的大写字母A~Z，转换为小写字母。 （知识点：变量和运算符） [选做题]
        public static void t4(){
            char h;
            h = 'A';
            h = (char)(h+32);
            System.out.println(h);
        }

}
