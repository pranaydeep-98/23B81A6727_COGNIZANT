import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class LambdaExample {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();

        names.add("Ravi");
        names.add("Amit");
        names.add("Kiran");
        names.add("Deep");

        Collections.sort(names, (a, b) -> a.compareTo(b));

        System.out.println(names);
    }
}
//[Amit, Deep, Kiran, Ravi]