package Test_encapsulation;

public class Test {
    public static void main(String[] args) {
        TestEncapsulation t1 = new TestEncapsulation();
        t1.setAge(201);
        t1.setName("zhangsan");
        System.out.println(t1.getAge()+"  "+t1.getName());

        TestEncapsulation t2 = new TestEncapsulation();
        t2.setAge(120);
        t2.setName("lisi");
        System.out.println(t2.getAge()+"  "+t2.getName());
    }
}
