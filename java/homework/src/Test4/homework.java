package Test4;

import java.util.Arrays;

public class homework {
    public static void main(String[] args) {
        //test7(new int[]{1, 6, 2, 3, 9, 4, 5, 7, 8});
        //test8(new int[]{1,1,1,2,3,4,4});
        test9();
    }

    //课后作业
   //1、编写一个简单程序，要求数组长度为5，分别赋值10，20，30，40，50，在控制台输出该数组的值。
    // （知识点：数组定义和创建、一维数组初始化）[必做题]
    private static void test1() {
        int[] a =  {10,20,30,40,50};
        for (int i = 0; i < a.length; i++) {
            System.out.println(a[i]);
        }
    }

    //2、将一个字符数组的值（neusofteducation）拷贝到另一个字符数组中。（知识点：数组复制） [必做题]
    private static void test2() {
        String[] a = {"neusofteducation"};
        String[]b = new String[10];
        System.arraycopy(a,0,b,0,1);
        System.out.println(b[0]);
    }

    //3、给定一个有9个整数（1,6,2,3,9,4,5,7,8）的数组，先排序，然后输出排序后的数组的值。
    // （知识点：Arrays.sort排序、冒泡排序） [必做题]
    private static void test3() {
        int[] a = {1,6,2,3,9,4,5,7,8};
        //Arrays.sort排序
        //Arrays.sort(arr_name(要排序的数组),fromindex(从下标为几开始),toindex(到下标为几结束))
        Arrays.sort(a);
        for (int i = 0; i < a.length; i++) {
            System.out.println(a[i]);
        }
        //冒泡排序法
        int[] b = {1,6,2,3,9,4,5,7,8};
        for (int i = 1; i < b.length; i++) {
            for (int j = 0; j < b.length-i; j++) {
                if (b[j] > b[j+1]){
                    int c = b[j];
                    b[j] = b[j+1];
                    b[j+1] = c;
                }else {
                    b[j] = b[j];
                    b[j+1] = b[j+1];
                }
            }
        }
        for (int i = 0; i < a.length; i++) {
            System.out.println(a[i]);
        }
    }

    //5,输出一个double型二维数组（长度分别为5、4，值自己设定）的值。（知识点：数组定义和创建、多维数组初始化、数组遍历）
    private static void test5(){
        double[][] a = {{1.1,2.2,3.3,4.4},{5.2,6.1,},{7.8},{0.9},{}};
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[i].length; j++) {
                System.out.println(a[i][j]);
            }
        }
    }

    //6、 在一个有8个整数（18，25，7，36，13，2，89，63）的数组中找出其中最大的数及其下标。（知识点：数组遍历、数组元素访问）
    private static void test6(){
        int[] a = {18,25,7,6,13,2,89,63};
        int j = 0;
        int max = a[0];
        for (int i = 0; i < a.length; i++) {
            if (max < a[i]) {
                max = a[i];

            }
        }
        System.out.println(max);
        for ( j = 0; j < a.length; j++) {
            if(max == a[j]){
                break;
            }

        }
        System.out.println(j);
    }

    //7、将一个数组中的元素逆序存放（知识点：数组遍历、数组元素访问） [选作题]
    private static void test7(int[] a){
        for (int i = a.length-1; i >=0; i--) {
            System.out.println(a[i]);
        }
    }

    //8. 将一个数组中的重复元素保留一个其他的清零。（知识点：数组遍历、数组元素访问） [选作题]
    private static void test8(int[] a){
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a.length; j++) {
                if (a[i] == a[j] && i!=j){
                    a[j] = 0;
                }
            }
            System.out.println(a[i]);
        }
    }

    //9、给定一维数组{ -10，2，3，246，-100，0，5} ，计算出数组中的平均值、最大值、最小值。
    // （知识点：数组遍历、数组元素访问） [选作题]
    private static void test9(){
        int[] a = {-10,2,3,246,-100,0,5};
        int sum = 0;
        float avg = 0;
        int max = a[0];
        int min = a[0];
        for (int i = 0; i < a.length; i++) {
            sum +=a[i];
            if (max < a[i]){
                max = a[i];
            }
            if(min > a[i]){
                min = a[i];
            }
        }
        avg = sum/a.length;
        System.out.println(avg);
        System.out.println(sum);
        System.out.println(max);
        System.out.println(min);
    }
}
