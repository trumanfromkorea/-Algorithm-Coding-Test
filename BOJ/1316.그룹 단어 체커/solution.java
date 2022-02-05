
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) throws IOException, NumberFormatException {
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(input.readLine());
        int answer = 0;

        for (int i = 0; i < n; i++) {
            boolean isGroupWord = true;
            char recentWord = ' ';
            List<Character> charList = new ArrayList<>();

            char[] word = input.readLine().toCharArray();

            for (char c: word) {

                if (!charList.contains(c)) {
                    charList.add(c);
                    recentWord = c;
                } else {
                    if (recentWord != c) {
                        isGroupWord = false;
                        break;
                    }
                }
            }
            answer += isGroupWord ? 1 : 0;
        }

        System.out.println(answer);

        input.close();
    }
}
