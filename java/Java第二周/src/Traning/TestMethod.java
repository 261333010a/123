package Traning;

public class TestMethod {

    //方法接收可变参数
    public static int sum(int... a){//可以为一个数，或多个数，或数组
        int sum = 0;
//        for (int i = 0; i < a.length; i++) {
//            sum += a[i];
//        }
//        return sum;

        //另一种
        for (int i:a){
            sum +=i;
        }
        return sum;
    }

    //定义阶乘方法
    public static int fact(int num){
        if (num == 1){
            return 1;
        }else {
            return num*fact(num-1);
        }
    }

    public static void main(String[] args) {
        System.out.println(fact(5));
    }


}
