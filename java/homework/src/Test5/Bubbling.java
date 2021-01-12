package Test5;

public class Bubbling {
    public static void bubbling(int[] a){
        for (int i = 1; i < a.length; i++) {
            for (int j = 0; j < a.length-i; j++) {
                if (a[j] > a[j+1]){
                    int temp = a[j+1];
                    a[j+1] = a[j];
                    a[j] = temp;
                }
            }
            System.out.println(a[i]);
        }

    }
}
