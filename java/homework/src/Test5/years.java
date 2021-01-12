package Test5;

public class years {
//2、编写一个方法，判断该年份是平年还是闰年。
    public int years(int x){
        if(x%100 ==0){
            if(x%400 == 0){
               return leap();
            }else {
                return ordinary();
            }
        }else{
            if (x%4 == 0 && x%100 !=0){
                return leap();
            }else {
                return ordinary();
            }
        }
    }
    public int leap(){
        System.out.println("闰年");
        return 0;
    }
    public int ordinary(){
        System.out.println("平年");
        return 0;
    }
}
