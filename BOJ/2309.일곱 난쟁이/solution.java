
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Main {

    private static int n = 9;
    private static List<Integer> heightList = new ArrayList<Integer>();

    public static void main(String[] args) throws IOException, NumberFormatException {
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

        int remains = 0;

        for (int i = 0; i < n; i++) {
            int value = Integer.parseInt(input.readLine());
            heightList.add(value);
            remains += value;
        }

        remains -= 100;
        findHeight(remains);
        heightList.stream().sorted().forEach(System.out::println);

        input.close();
    }

    public static void findHeight(int remains) {
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                int a = heightList.get(i);
                int b = heightList.get(j);
                if (a + b == remains) {
                    heightList.remove(Integer.valueOf(a));
                    heightList.remove(Integer.valueOf(b));
                    return;
                }
            }
        }
    }

}
