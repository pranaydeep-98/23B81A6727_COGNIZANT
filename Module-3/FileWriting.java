import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class FileWriting {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter text: ");
        String text = sc.nextLine();

        FileWriter writer = new FileWriter("output.txt");
        writer.write(text);
        writer.close();

        System.out.println("Data written successfully");

        sc.close();
    }
}
/*
Enter text: Hello Meow!
Data written successfully */