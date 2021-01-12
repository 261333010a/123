package Test_01_08_aft;

public class Test_Method {
    //方法

    //公共方法 public  私有方法  private

    /*
    没有返回值 void  有返回值把void改为返回的数据类型  并在最后加一个return
    public [static] void(数据类型) 方法名([数据类型 参数,数据类型 参数,数据类型 参数,。。。]){
        retrun 值；
    }
     */

    /*
    Object 是所有类的父类，Java的所有类都继承了Object  子类可以使用Object的所有方法

    static 修饰的方法 通过类名可以直接调用

    没有static(静态) 修饰的方法，必须把类实例化 (new) 成对象才能使用 对象名.方法名调用
    对象名 名字 = new 对象名();

    私有方法只能自己用， 不能被其他对象调用
     */

    /*
    有参方法 括号里有参数    无参方法  括号里无参数
     */

    public static int ass(int x){//x是形式参数(形参) 不具备任何参数
        if (x >= 0) {
            x =x;
        }else {
            x = -x;
        }
        return x;
    }

    public static void main(String[] args) {
         int a = ass(-10);//传实参
        System.out.println(a);

    }
}
