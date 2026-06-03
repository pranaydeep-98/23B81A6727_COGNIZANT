import java.util.HashMap;
import java.util.Scanner;

public class HashMapExample {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        HashMap<Integer, String> students = new HashMap<>();

        System.out.print("How many entries? ");
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < n; i++) {
            System.out.print("Enter ID: ");
            int id = sc.nextInt();
            sc.nextLine();

            System.out.print("Enter Name: ");
            String name = sc.nextLine();

            students.put(id, name);
        }

        System.out.print("Enter ID to search: ");
        int id = sc.nextInt();

        System.out.println("Name: " + students.get(id));

        sc.close();
    }
}
/*
How many entries? 2
Enter ID: 6701
Enter Name: Hegde
Enter ID: 6791
Enter Name: mrunal
Enter ID to search: 6701
Name: Hegde */
