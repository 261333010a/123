package Test_01_07_aft;

import java.util.Scanner;

public class guessNumber {
    public static void main(String[] args) {
        //猜数游戏
        int number = (int)(Math.random()*100);//随机数：Math.random
        int result = 0;

        //接收用户在控制台上的输入
        //Scanner s = new Scanner(System.in);

        do{
            System.out.println("请输入数字：");
            Scanner s = new Scanner(System.in);//获取控制台数据
            result = s.nextInt();//将接收的数据赋值給result
            System.out.println(s);
            System.out.println(s);
            System.out.println(s);
            System.out.println(s);

            if (result > number){
                System.out.println("大了");
            }else if (result < number){
                System.out.println("小了");
            }
        }while (result != number);//循环继续下去的条件放在括号

        System.out.println("猜中了");
    }
}
