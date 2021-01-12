package Test6;

public class Vehicle {
//    7、定义一个汽车类Vehicle，要求如下：[选做题]
//    7.1属性包括：汽车品牌brand（String类型）、颜色color（String类型）和速度speed（double类型），并且所有属性为私有。
//    7.2至少提供一个有参的构造方法（要求品牌和颜色可以初始化为任意值，但速度的初始值必须为0）。
//    7.3为私有属性提供访问器方法。注意：汽车品牌一旦初始化之后不能修改。
//    7.4定义一个一般方法run()，用打印语句描述汽车奔跑的功能
//    7.5定义测试类VehicleTest，在其main方法中创建一个品牌为“benz”、颜色为“black”的汽车

    private String brand;
    private String color;
    private double speed = 0;

    public Vehicle(){

    }

    public Vehicle(String brand,String color){
        this.brand = brand;
        this.color = color;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getBrand() {
        return brand;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColor() {
        return color;
    }

    public void setSpeed(double speed) {
        this.speed = speed;
    }

    public double getSpeed() {
        return speed;
    }

    public void run(){
        speed += 20;
        System.out.println("汽车的速度为"+speed+"km/h");
    }

}
