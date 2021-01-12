package Test6;

public class Person {
//    5、定义两个类，描述如下： [必做题]  第六题跟第五题一样
//            5.1定义一个人类Person：
//            5.1.1定义一个方法sayHello()，可以向对方发出问候语“hello,my name is XXX”
//            5.1.2有三个属性：名字、身高、体重
//            5.2定义一个PersonCreate类：
//            5.2.1创建两个对象，分别是zhangsan，33岁，1.73；lishi，44，1.74
//            5.2.2分别调用对象的sayHello()方法。

    String name;
    int height;//身高
    int weight;//体重

    public void sayHello(){
        System.out.println("hello,my name is "+name+"今年"+PersonCreate.age+"岁");
    }
    public Person(){

    }

    public Person(String name,int height,int weight){
        this.name =name;
        this.height = height;
        this.weight = weight;
    }
    public static class PersonCreate{
        static int age;
        public PersonCreate(int age){
            this.age = age;
        }
    }
}
