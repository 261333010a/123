package Test6;

import java.util.Arrays;

public class homework_Test3_4 {
//3、定义一个笔记本类，该类有颜色（char）和cpu型号（int）两个属性。 [必做题]
//3.1 无参和有参的两个构造方法；有参构造方法可以在创建对象的同时为每个属性赋值；
//3.2  输出笔记本信息的方法
//3.3  然后编写一个测试类，测试笔记本类的各个方法。

    public static class Computer{
        char color;
        int CPU;

        public Computer(){
        }

        public Computer(char color,int CPU){
            this.color = color;
            this.CPU = CPU;
        }

        public void ShowCom(){
            System.out.println("颜色为："+color);
            System.out.println("CPU为："+CPU);
        }

    }

    public static void main(String[] args) {
        Computer c = new Computer();
        c.color = '红';
        c.CPU = 123456;
        c.ShowCom();

        Student[] s = new Student[3];
        s[0] = new Student("a",1,60);
        s[1] = new Student("b",2,50);
        s[2] = new Student("c",3,79);

        Student.sort(s);
        for (int i = 0; i < s.length; i++) {
            System.out.println(s[i].toString());

        }


    }


//4、设计一个类Student，该类包括姓名、学号和成绩。设计一个方法，按照成绩从高到低的顺序输出姓名、学号和成绩信息。[选做题]
    public static class Student{
        String name;
        int id;
        int score;

        public Student(){

        }

        public Student(String name,int id,int score){
            this.name = name;
            this.id = id;
            this.score = score;
        }


        public static void sort(Student[] s){
            for (int i = 1; i < s.length; i++) {
                for (int j = 0; j < s.length-i; j++) {
                    if (s[j].score < s[j+1].score) {
                        Student stu = s[j+1];
                        s[j+1] = s[j];
                        s[j] = stu;
                    }
                }
            }
        }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", score=" + score +
                '}';
    }
}


}
