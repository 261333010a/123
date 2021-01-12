package Test5;

public class Prime {
    //3、编写一个方法，输出大于200的最小的质数。
    public static int prime(){
        int i = 200;
        outer: for ( i = 200;  ; i++) {
            inner: for (int j = 2; j < i; j++) {//控制次数，只循环到自己减一
                if (i%j == 0){//如果存在一个数x能够被n整除，则这个不是质数，跳出该次循环，开始下一个数验证
                    break inner;
                }
                if(j ==i-1){//找到质数的条件是，y累加到i-1了，依然没有找到一个数成立（i%y==0）
                    break outer;
                }
            }
        }
        return i;
    }
}
