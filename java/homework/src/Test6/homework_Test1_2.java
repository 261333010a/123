package Test6;

public class homework_Test1_2 {
    //1、定义一个点类Point，包含2个成员变量x、y分别表示x和y坐标，2个构造器Point()和Point(int x0,y0),
// 以及一个movePoint（int dx,int dy）方法实现点的位置移动，创建两个Point对象p1、p2，
// 分别调用movePoint方法后，打印p1和p2的坐标。[必作题]
    public static class Point{
        int x,y;

        public Point(){

        }

        public Point(int x0,int y0){
            this.x = x0;
            this.y = y0;
        }

        public void movePoint(int dx,int dy){
            this.x += dx;
            this.y += dy;
        }
    }

    public static void main(String[] args) {
        Point p1 = new Point();
        p1.movePoint(10,10);
        System.out.println("x:"+p1.x+" "+"y:"+p1.y);

        Point p2 = new Point(6,7);
        p2.movePoint(10,20);
        System.out.println("x:"+p2.x+" "+"y:"+p2.y);
        System.out.println();

        Rectangle r = new Rectangle(5,6);
        r.ShowAll();
    }


    //2、定义一个矩形类Rectangle：（知识点：对象的创建和使用）[必做题]
    public static class Rectangle{
        int width,height;

        public Rectangle(int width,int height){
            this.width = width;
            this.height = height;
        }

        public int Area(){
            int area;
            area = width*height;
            return area;
        }

        public int Perimeter(){
            int per;
            per = 2*(width+height);
            return per;
        }

       public void ShowAll(){
           System.out.println("宽为："+width+"长为："+height+"面积为："+Area()+"周长为："+Perimeter());
        }
    }


}
