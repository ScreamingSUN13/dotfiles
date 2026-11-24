import java.util.*;
import java.util.stream.Collectors;

/**
 * Javadoc comment: sample file to test syntax highlighting.
 */
public class test {

    // Constants
    static final int CONSTANT_VALUE = 42;
    static final double PI = 3.14159;
    static final String GREETING = "Hello, world!";

    // Enum
    enum Color {
        RED, GREEN, BLUE
    }

    // Interface
    interface Speaker {
        String speak();
    }

    // Abstract base class
    static abstract class Animal implements Speaker {
        protected String name;
        protected int legs;

        Animal(String name, int legs) {
            this.name = name;
            this.legs = legs;
        }

        @Override
        public String toString() {
            return "<Animal name=" + name + " legs=" + legs + ">";
        }
    }

    static class Dog extends Animal {
        Dog(String name) {
            super(name, 4);
        }

        @Override
        public String speak() {
            return name + " says Woof!";
        }
    }

    // Generic record
    record Point(double x, double y) {
        double distanceTo(Point other) {
            double dx = this.x - other.x;
            double dy = this.y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }
    }

    static List<Integer> fibonacci(int n) {
        List<Integer> sequence = new ArrayList<>();
        int a = 0, b = 1;
        for (int i = 0; i < n; i++) {
            sequence.add(a);
            int next = a + b;
            a = b;
            b = next;
        }
        return sequence;
    }

    static void processData(Map<String, Integer> items) {
        if (items == null) {
            items = new HashMap<>();
        }
        for (Map.Entry<String, Integer> entry : items.entrySet()) {
            int value = entry.getValue();
            if (value % 2 == 0) {
                System.out.println(entry.getKey() + ": " + value + " is even");
            } else if (value < 0) {
                System.out.println(entry.getKey() + ": " + value + " is negative");
            } else {
                System.out.println(entry.getKey() + ": " + value + " is odd");
            }
        }

        try {
            int risky = 10 / items.size();
            System.out.println("Risky result: " + risky);
        } catch (ArithmeticException e) {
            System.out.println("Caught an error: " + e.getMessage());
        } finally {
            System.out.println("Done processing.");
        }
    }

    public static void main(String[] args) {
        Dog dog = new Dog("Rex");
        System.out.println(dog.speak());
        System.out.println(dog);

        Point p1 = new Point(0, 0);
        Point p2 = new Point(3, 4);
        System.out.println("Distance: " + p1.distanceTo(p2));

        System.out.println(fibonacci(10));

        Map<String, Integer> data = new LinkedHashMap<>();
        data.put("a", 1);
        data.put("b", 2);
        data.put("c", -3);
        processData(data);

        List<Integer> numbers = new ArrayList<>();
        for (int x = 0; x < 10; x++) {
            if (x % 2 == 0) {
                numbers.add(x * x);
            }
        }
        List<Integer> squaredEvens = numbers.stream()
                .map(n -> n * 2)
                .collect(Collectors.toList());

        System.out.println(numbers);
        System.out.println(squaredEvens);

        Color favorite = Color.BLUE;
        switch (favorite) {
            case RED -> System.out.println("Red selected");
            case GREEN -> System.out.println("Green selected");
            case BLUE -> System.out.println("Blue selected");
        }

        System.out.printf("%d | %.5f | %s%n", CONSTANT_VALUE, PI, GREETING);
    }
}
