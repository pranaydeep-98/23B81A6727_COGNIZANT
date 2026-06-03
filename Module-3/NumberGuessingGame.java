import java.util.Random;
import java.util.Scanner;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random random = new Random();

        int target = random.nextInt(100) + 1;
        int guess;

        do {
            System.out.print("Guess a number between 1 and 100: ");
            guess = sc.nextInt();

            if (guess > target) {
                System.out.println("Too high!");
            } else if (guess < target) {
                System.out.println("Too low!");
            } else {
                System.out.println("Correct! You guessed the number.");
            }
        } while (guess != target);

        sc.close();
    }
}
/*
output:
Guess a number between 1 and 100: 233
Too high!
Guess a number between 1 and 100: 34
Too low!
Guess a number between 1 and 100: 89
Too low!
Guess a number between 1 and 100: 100
Too high!
Guess a number between 1 and 100: 90
Too low!
Guess a number between 1 and 100: 95
Too high!
Guess a number between 1 and 100: 93
Correct! You guessed the number.
*/