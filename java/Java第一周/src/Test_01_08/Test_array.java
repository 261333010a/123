package Test_01_08;

public class Test_array {
       /*
       initValue 定义数组的初始值

       数组的属性：
            数组的长度   array.length
            数组的索引   index  下标从0开始
            数组的类型   type
            数组的名称   name
        */

    /*
    多维数组
    int [] [] e;
     */
    public static void main(String[] args) {
//        int [] [] a = new int[][] {{1},{2,3},{4,5,6}};
//
//        for (int i = 0; i < a.length; i++) {
//            for (int j = 0; j <a[i].length ; j++) {
//
//            }
//        }

        int[] a  = new int[] {5,1,2,7,6,10};//定义一个数组

        for (int i = 1; i < a.length; i++) {//循环数组
            for (int j = 0; j < a.length-i; j++) {//每找到一个数，循环就少一次
                //判断大小
                if (a[j] > a[j+1]) {
                    int s = 0;
                    s = a[j];
                    a[j] = a[j+1];
                    a[j+1] = s;
                }
            }
        }
        for (int i = 0; i < a.length; i++) {
            System.out.println("数组a为："+a[i]);
        }
    }
        /*
        数组的复制
        system.arraycopy(source,srcPos,dest,destPos,lenth)
        source: 要复制的数组
        srcPos：起始位置
        dest：复制到的那个数组 目标数组
        destPos:目标数组中的起始下标位置
        length：要复制的数组的元素个数
         */

        /*
        数组的排序
        Arrays.sort(数组的名字[,开始的索引,结束的索引]);  默认全部 升序
         */

    /*
    冒泡排序法
    n个数 要找 n-1 次
    代码
    for(int i = 1; i < 数组的长度; i++){
        for(int j =0; j < 数组的长度 - i; j++){
            每找到一个数循环就减少i次

            交换位置
            if(a[j] > a[j+1]){  升序 >   降序  <
                int s = a[j];
                a[j] = a[j+1];
                a[j+1] = s;
            }
        }
    }
     */
}
