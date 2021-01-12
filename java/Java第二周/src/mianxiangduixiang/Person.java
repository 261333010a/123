package mianxiangduixiang;

public class Person {

    //构造方法(方法名和类名相同)
    //无参构造方法
    public Person(){

    }

    //有参构造方法
    public Person(String name){
        this.name = name;
    }

    private String name;
    private Long id;
    private Long classId;
    private String phone;
    private String susheid;

    //无参方法
    public void xuanke(){

    }

    public void selectscore(){

    }

    public void test(){

    }

    public static void main(String[] args) {

        //Person p1=new Person("yuwenji");
        Person p1=new Person();//实例化方法
        String phone=p1.phone;

        p1.xuanke();//调用方法

        //Person p2=new Person("liangchulong");
        Person p2=new Person();
        p2.classId=12L;
        p2.name="杭三";

        System.out.println("p2.phone:"+p2.phone);;

        //Person p3=new Person("ouyang");
        Person p3=new Person();
        p3.classId=13L;
        p3.name="lisi";

    }


}
