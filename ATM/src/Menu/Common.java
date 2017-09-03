package Menu;

import java.util.Scanner;

public class Common {
    private static Scanner scanner = new Scanner(System.in);

    public static void resetScanner() {
        scanner = new Scanner(System.in);
    }

    public static boolean Error(String err) {
        System.out.println();
        System.out.println("***********************");
        System.out.println();
        System.out.println(err);
        System.out.println();
        System.out.println("*********************** ");
        System.out.println();
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean Success(String msg) {
        System.out.println();
        System.out.println("+++++++++++++++++++++++");
        System.out.println();
        System.out.println(msg);
        System.out.println();
        System.out.println("+++++++++++++++++++++++");
        System.out.println();
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return true;
    }

    public static void Line(String msg) {
        System.out.println(msg);
    }
    public static void Ln(int cnt) {
        while (cnt-- > 0)
            System.out.println();
    }
    public static void Title(String msg) {
        System.out.println("======================= " + msg + " =======================");
    }
}
