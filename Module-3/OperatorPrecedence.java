public class OperatorPrecedence {
    public static void main(String[] args) {

        int result1 = 10 + 5 * 2;
        int result2 = (10 + 5) * 2;
        int result3 = 20 / 2 + 3 * 4;
        int result4 = 10 - 4 + 2 * 3;

        System.out.println("10 + 5 * 2 = " + result1);
        System.out.println("(10 + 5) * 2 = " + result2);
        System.out.println("20 / 2 + 3 * 4 = " + result2);
        System.out.println("10 - 4 + 2 * 3 = " + result4);
    }
}
/*
output:
10 + 5 * 2 = 20
(10 + 5) * 2 = 30
20 / 2 + 3 * 4 = 30
10 - 4 + 2 * 3 = 12
*/