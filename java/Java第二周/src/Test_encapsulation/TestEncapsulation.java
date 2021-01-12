package Test_encapsulation;

public class TestEncapsulation {

    /*
    封装：
    对成员访问权限的任何控制(包括public)都可以称为封装
    ①把属性封装起来 ，公有变私有 private
    ②提供接口可以访问到属性  get set 方法
     */

    /*
    访问权限修饰符
    成员(属性及方法)的封装：private > protecrted > default(成员前面不用添加任意修饰符，即为默认) > public
    类的封装：public default

     */

    private int age;
    private String name;

    public void setAge(int age) {
       if (age > 0 && age < 200){
           this.age = age;
       }else {
           System.out.println(age+"年龄不合适");
       }
    }

    public int getAge() {
        return age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
