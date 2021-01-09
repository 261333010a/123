package Test3;

import java.util.Scanner;

public class homework {
    public static void main(String[] args) {
        Test17();
    }

    //练习 有两个整型变量x，y，请在控制台上输出x与y中值较大的那个数。
        public static void ex1(){
            int x = 100;
            int y = 200;
            //三元运算符
            System.out.println(x>y?x:y);

            //if语句
            if(x>y){
                System.out.println(x);
            }else {
                System.out.println(y);
            }
        }

        //练习 计算1+2+3+…+100的和（提示利用while语句）
        public static void ex2(){
            int i = 1;
            int sum = 0;
            while (i < 101) {
                sum +=i;
                i++;
            }
            System.out.println(sum);

            //计算从1到100的所有奇数相加（提示利用while语句）
            int j = 1;
            int s = 0;
            while (j < 101 ){
                s += j;
                j = j+2;
            }
            System.out.println(s);
        }

        //练习 用do while 循环来改写1加到100
        private static void ex3() {
            int i = 1;
            int sum = 0;
            do {
                sum +=i;
                i++;
            }while (i<101);
            System.out.println(sum);
        }

        //练习 用for循环来改写1加到100
        private static void ex4() {
            int sum = 0;
            for (int i = 0; i < 101; i++) {
                sum +=i;
            }
            System.out.println(sum);

            int s = 0;
            for (int j = 0; j < 101; j=j+2) {
                s += j;
            }
            System.out.println(s);
        }

        //课后作业
    //1、企业发放的奖金根据利润提成。利润低于或等于10万元时，奖金可提10%；
    // 利润高于10万元，低于或等于20万元时，高于10万元的部分，可提成7.5%；
    // 高于20万，低于或等于40万时，高于20万元的部分，可提成5%；
    // 高于40万，低于或等于60万时，高于40万元的部分，可提成3%；
    // 高于60万，低于或等于100万时，高于60万元的部分，可提成1.5%，
    // 高于100万元时，超过100万元的部分按1%提成，在
    // 程序中设定一个变量为当月利润，求应发放奖金总数？（知识点：条件语句） [必做题]
        private static void Test1() {
            int result = 0;//定义一个储存控制台的值,基础值为0


            System.out.println("当月利润为："+"万元");
            Scanner s = new Scanner(System.in);//获取控制台的值
            result = s.nextInt();//将控制台的值赋給result

            if(result > 0 && result <= 10){
                System.out.println("奖金总数为："+(float)(result*0.1)+"万元");
            }else if (result > 10 && result <= 20){
                System.out.println("奖金总数为："+(10*0.1+(result-10)*0.075)+"万元");
            }else if (result > 20 && result <= 40){
                System.out.println("奖金总数为："+(10*0.1+20*0.075+(result-20)*0.05)+"万元");
            }else if (result > 40 && result <= 60) {
                System.out.println("奖金总数为：" + (10*0.1+20*0.075+40*0.05+(result-40)*0.03)+"万元");
            }else if (result > 60 && result <= 100) {
                System.out.println("奖金总数为："+(10*0.1+20*0.075+40*0.05+60*0.03+(result-60)*0.015)+"万元");
            }else if (result > 100){
                System.out.println("奖金总数为："+(10*0.1+20*0.075+40*0.05+60*0.03+100*0.015+(result-100)*0.01)+"万元");
            }
        }

    //2、给定一个成绩a，使用switch结构求出a的等级。
    // A：90-100，B：80-89，C：70-79，D：60-69，E：0~59（知识点：条件语句switch）
    private static void Test2() {
        int res = 0;

        System.out.println("请输入成绩：");
        Scanner s = new Scanner(System.in);
        res = s.nextInt();

        int grade = res/10;//定义一个变量 等级 将等级除以10
        //System.out.println(grade);

        /*
        将各个等级分为 A：10  B：9  C：8  D：7  E：6
         */
        switch (grade+1){
            case 10:
                    System.out.println("成绩等级为A");
                    break;
            case 9:
                System.out.println("成绩等级为B");
                break;
            case 8:
                System.out.println("成绩等级为C");
                break;
            case 7:
                System.out.println("成绩等级为D");
                break;
            case 6:
                System.out.println("成绩等级为E");
                break;
            default:
                System.out.println("成绩等级为E");
        }
    }

    //3、假设某员工今年的年薪是30000元，年薪的年增长率6%。编写一个Java应用程序计算该员工10年后的年薪，
    // 并统计未来10年（从今年算起）总收入。（知识点：循环语句for）
    private static void Test3() {
        int sal =30000;
        for (int i = 1; i < 11; i++) {
            //1 sal*0.06+sal sal*1.06
            //2 1+1*0.06        sal*1.06*1.06  sal*0.06+sal
            //3 2+2*0.06        sal*1.06*1.06*1.06
            if (i == 10) {
                System.out.println("十年后的年薪为：" + (int) (sal * 1.06));
            }
            sal+=sal*1.06;
        }
        System.out.println(sal);
    }

    //4、猴子第一天摘下若干个桃子，当即吃了一半，还不瘾，又多吃了一个，第二天早上又将剩下的桃子吃掉一半，又多吃了一个。
    // 以后每天早上都吃了前一天剩下的一半零一个。到第10天早上想再吃时，见只剩下一个桃子了。求第一天共摘了多少。
    // (知识点：循环语句 while）
    private static void Test4() {
        int a = 1;//定义天数
        int sum = 1;//定义一个变量储存桃子总数
        while (a<11){
            sum = (sum+1)*2;
            a++;
        }
        System.out.println(sum);
    }

    //5、输入一个数字，判断是一个奇数还是偶数（知识点：条件语句）
    private static void Test5(){
        int a = 0;
        System.out.println("请输入数字：");
        Scanner s = new Scanner(System.in);
        a = s.nextInt();
        if(a%2 == 0){
            System.out.println("偶数");
        }else if (a%2 == 1) {
            System.out.println("奇数");
        }
    }

    //6、编写程序， 判断一个变量x的值，如果是1，输出x=1，如果是5，输出x=5，如果是 10，输出x=10，
    // 除了以上几个值，都输出x=none。（知识点：条件语句）
    private static void Test6(){
        int x = 0;
        System.out.println("请输入数字：");
        Scanner s = new Scanner(System.in);
        x = s.nextInt();
        switch (x){
            case 1:
                System.out.println("x=1");
                break;
            case 5:
                System.out.println("x=5");
                break;
            case 10:
                System.out.println("x=10");
                break;
            default:
                System.out.println("x=none");
        }
    }

    //7、判断一个数字是否能被5和6同时整除（打印能被5和6整除），或只能被5整除（打印能被5整除），或只能被6整除，
    // （打印能被6整除），不能被5或6整除，（打印不能被5或6整除）（知识点：条件语句）
    private static void Test7(){
        int x = 0;
        System.out.println("请输入数字：");
        Scanner s = new Scanner(System.in);
        x = s.nextInt();
        if(x%5 == 0){
            System.out.println("能被5整除");
        }else if(x%6 == 0){
            System.out.println("能被6整除");
        }else if(!(x%5 == 0 && x%6 == 0)){
            System.out.println("不能被5或6整除");
        }
    }

    //8、输入一个年份，判断这个年份是否是闰年（知识点：条件、循环语句）
    //能被4整除且不能被100整除，或者被400整除
    private static void Test8(){
        int x = 0;
        System.out.println("请输入年份：");
        Scanner s = new Scanner(System.in);
        x = s.nextInt();

        if(x%100 ==0){//确定是不是世纪年
            if(x%400 == 0){
                System.out.println("闰年");
            }else {
                System.out.println("不是闰年");
            }
        }else{
            if (x%4 == 0 && x%100 !=0){
                System.out.println("闰年");
            }else {
                System.out.println("不是闰年");
            }
        }
    }

    //9、输入一个0～100的分数，如果不是0～100之间，打印分数无效，根据分数等级打印A,B,C,D,E
    // A：90-100，B：80-89，C：70-79，D：60-69，E：0~59（知识点：条件语句if elseif）
    private static void Test9(){
        int a = 0;
        System.out.println("你的成绩是：");
        Scanner s = new Scanner(System.in);
        a = s.nextInt();
        if (a>=0 && a<=100){
            if(a<=59){
                System.out.println("成绩等级E");
            }else if (a>59 && a <= 69){
                System.out.println("成绩等级D");
            }else if (a>69 && a <= 79){
                System.out.println("成绩等级C");
            }else if (a>79 && a <= 89){
                System.out.println("成绩等级B");
            }else if (a>89 && a <= 100){
                System.out.println("成绩等级A");
            }
        }else {
            System.out.println("成绩输入错误");
        }
    }

    //10、输入三个整数x,y,z，请把这三个数由小到大输出（知识点：条件语句）
    private static void Test10(){
        int x = 10, y = 15, z = 3;
        if(x > y){//如果大于  把y的值給x
            int a = y;
            y = x;
            x = a;
        }
        if(x > z){
            int a = z;
            z = x;
            x = a;
        }
        if(y > z){
            int a = z;
            z = y;
            y = a;
        }
        //最终输出顺序 x y z   x最小 ，z最大
        System.out.println("小到大排序为："+x+" "+y+" "+z);
    }

    //11、有一个不多于5位的正整数，求它是几位数，分别打印出每一位数字。（知识点：条件语句）
    private static void Test11() {
        int a = 0;
        System.out.println("请输入一位不多于5位的正整数：");
        Scanner sc = new Scanner(System.in);
        a = sc.nextInt();

        if (a < 0 || a > 99999) {
            System.out.println("数字输入错误");
        }

        if (a > 0 && a < 10) {
            System.out.println("一位数");
            System.out.println("每一位数字：" + a);
        } else if (a >= 10 && a < 100) {
            System.out.println("二位数");
            System.out.println("每一位数字：" + a / 10 + " " + a % 10);
        } else if (a >= 100 && a < 1000) {
            System.out.println("三位数");
            System.out.println("每一位数字：" + a / 100 + " " + a % 100 / 10 + " " + a % 10);
        } else if (a >= 1000 && a < 10000) {
            System.out.println("四位数");
            System.out.println("每一位数字：" + a / 1000 + " " + a % 1000 / 100 + " " + a % 100/10+" "+a % 10);
        } else if (a >= 10000 && a < 100000){
            System.out.println("五位数");
            System.out.println("每一位数字：" + a / 10000 + " " + a % 10000 / 1000 + " " + a % 1000/100+" "+a % 100/10+" "+a % 10);
        }
    }

    //12、编写一个程序，计算邮局汇款的汇费。如果汇款金额小于100元，汇费为一元，如果金额在100元与5000元之间，按1%收取汇费，
    // 如果金额大于5000元，汇费为50元。汇款金额由命令行输入。（知识点：条件语句） [选做题]
    private static void Test12(){
        int a = 0;
        System.out.println("请汇款金额：");
        Scanner s = new Scanner(System.in);
        a = s.nextInt();

        if (a < 100) {
            System.out.println("汇费为:"+(a-1));
        }else if (a >= 100 && a < 5000){
            System.out.println("汇费为："+(a*0.99));
        }else if (a > 5000){
            System.out.println("汇费为："+ (a-50));
        }
    }

    //13、分别使用for循环，while循环，do循环求1到100之间所有能被3整除的整数的和。（知识点：循环语句）
    private static void Test13(){
        int sum = 0;
        //for
        for (int i = 1;i < 101;i++) {
            if (i % 3 == 0) {
                sum += i;
            }
        }
        System.out.println(sum);


        //while
        int x = 1;
        sum = 0;
        while (x< 101){
            if (x % 3 == 0){
                sum += x;
                x++;
            }else {
                x++;
            }
        }
        System.out.println(sum);

        //do
        int j = 1;
        sum = 0;
        do {
            if (j % 3 == 0){
                sum += j;
                j++;
            }else {
                j++;
            }
        }while (j < 101);
        System.out.println(sum);
    }

    //14、输出0-9之间的数，但是不包括5。
    private static void Test14(){
       for ( int i = 0;i < 10; i++){
           if (i == 5){
               continue;
           }
           System.out.println(i);
       }
    }

    //15、编写一个程序，求整数n的阶乘，例如5的阶乘是1*2*3*4*5 [选做题]
    private static void Test15(){
        int  n = 0;
        int fact = 1;
        System.out.println("请输入数字：");
        Scanner s = new Scanner(System.in);
        n = s.nextInt();
        for (int i = 1; i <n+1;i++){
            fact = fact*i;
        }
        System.out.println("阶乘为："+fact);
    }

    //16、编写一个程序，找出大于200的最小的质数[选做题]
    private static void Test16(){
        int i = 200;
        int j =2;
        outer: for (i = 200;  ; i++) {
            inner: for ( j = 2; j < i; j++) {//控制次数，只循环到自己减一
                if (i%j == 0){//如果存在一个数x能够被n整除，则这个不是质数，跳出该次循环，开始下一个数验证
                    break inner;
                }
                if(j ==i-1){//找到质数的条件是，y累加到i-1了，依然没有找到一个数成立（i%y==0）
                    break outer;
                }
            }
        }
        System.out.println(i);
    }

    //17、由命令行输入一个4位整数，求将该数反转以后的数，如原数为1234，反转后的数位4321 [选做题]
    private static void Test17(){
        int a = 0;
        System.out.println("请输入一个四位数:");
        Scanner s = new Scanner(System.in);
        a = s.nextInt();
        if (a >999 && a <10000){
            a =a;
        }else {
            System.out.println("输入有误");
        }
        int b = a/1000;
        int c = a%1000/100;
        int d = a%100/10;
        int e = a%10;

        System.out.println(""+e+""+d+""+c+""+b);
    }

}
