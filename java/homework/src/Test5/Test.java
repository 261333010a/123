package Test5;

public class Test {
    public static void main(String[] args) {
        Factorials f =new Factorials();
        int a = f.Factorials(5);
        System.out.println(a);
        System.out.println();

        years y = new years();
        int b = y.years(2000);
        System.out.println();

        //Prime p = new Prime();
        Prime.prime();
        System.out.println(Prime.prime());
        System.out.println();

        //Bubbling bu =new Bubbling();
        Bubbling.bubbling(new int[]{2, 6, 1, 8, 9});


        }
}

