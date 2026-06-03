import java.util.Scanner;

public class FactorialCalculator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a non-negative integer: ");
        int num = sc.nextInt();

        long factorial = 1;

        for (int i = 1; i <= num; i++) {
            factorial *= i;
        }

        System.out.println("Factorial of " + num + " = " + factorial);
        sc.close();
    }
}
/*
Enter a non-negative integer: 5
Factorial of 5 = 120
*/