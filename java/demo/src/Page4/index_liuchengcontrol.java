package Page4;

import java.util.Scanner;

public class index_liuchengcontrol {
    //for循环  if while do while  switch
    public static void main(String[] args) {
        test2();
    }
    //判断时奇数还是偶数
    private static void test1() {
        int a = 0;
        System.out.println("请输入数字：");
        Scanner s = new Scanner(System.in);
        a = s.nextInt();

        if(a/2 == 0){
            System.out.println("偶数");
        }else {
            System.out.println("奇数");
        }

    }

    //应用for循环打印菱形
    private static void test2(){
        for (int i = 0; i < 10; i++) {
            
        }
    }
}