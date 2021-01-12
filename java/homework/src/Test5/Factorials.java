package Test5;

public class Factorials {
    //1、编写一个方法，求整数n的阶乘，例如5的阶乘是1*2*3*4*5。
    public int Factorials(int num){
        if (num == 1){
            return 1;
        }else {
            return num*Factorials(num-1);
        }
    }
}
