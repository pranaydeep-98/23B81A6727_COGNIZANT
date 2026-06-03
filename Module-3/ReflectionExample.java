import java.lang.reflect.Method;

class Student {
    public void display() {
        System.out.println("Student Method");
    }
}

public class ReflectionExample {
    public static void main(String[] args)
            throws Exception {

        Class<?> cls =
                Class.forName("Student");

        Object obj =
                cls.getDeclaredConstructor()
                        .newInstance();

        Method[] methods =
                cls.getDeclaredMethods();

        for (Method method : methods) {
            System.out.println(method.getName());
            method.invoke(obj);
        }
    }
}
/*
display
Student Method */