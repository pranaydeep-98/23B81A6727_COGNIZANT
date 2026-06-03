public class TypeCastingExample {
    public static void main(String[] args) {
        double decimalValue = 25.78;
        int intValue = (int) decimalValue;
        int number = 50;
        double doubleValue = (double) number;
        System.out.println("Original double value: " + decimalValue);
        System.out.println("After casting to int: " + intValue);
        System.out.println("Original int value: " + number);
        System.out.println("After casting to double: " + doubleValue);
    }
}
/*
output:
Original double value: 25.78
After casting to int: 25
Original int value: 50
After casting to double: 50.0
*/