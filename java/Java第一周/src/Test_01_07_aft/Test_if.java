package Test_01_07_aft;

public class Test_if {
    public static void main(String[] args) {
        /*
        switch(){
          case 值一:语句;
                    break;
          ...
          default :什么都没匹配到
        }

        switch 只接收int,byte,char,short,String类型
        不允许有重复的值
        每次case 结束后都要有break;
         */

        //乘法口诀表
        for (int i = 1; i <10 ; i++) {
            for (int j = 1; j <=i ; j++) {
                System.out.print(""+i+"*"+j+"="+i*j+" ");
            }
            System.out.println();//换行，输出到下一行
        }

    }
}
