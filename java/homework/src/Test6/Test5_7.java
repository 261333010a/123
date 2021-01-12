package Test6;

public class Test5_7 {
    public static void main(String[] args) {
        Person p = new Person();
        p.name = "laowang";
        p.sayHello();

        Person p1 = new Person();
        new Person.PersonCreate(33);
        p1.name = "zhangsan";
        p1.height = 173;
        p1.sayHello();

        Person p2 = new Person();
        new Person.PersonCreate(44);
        p2.name = "lisi";
        p2.height = 174;
        p2.sayHello();

        Vehicle v = new Vehicle();
        v.setBrand("benz");
        v.setColor("black");
        System.out.println(v.getBrand()+" "+v.getColor());
        v.run();
        

    }
}
