
import java.io.*;
import java.util.ArrayList;
import java.util.Stack;

public class Main {

    private static ArrayList<String> brackets = new ArrayList<>();

    public static void main(String[] args) throws IOException, NumberFormatException {
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

        boolean isVPS;
        String answer = "";
        Stack<Character> stack = new Stack<>();

        int n = Integer.parseInt(input.readLine());

        for (int i = 0; i < n; i++) {
            isVPS = true;
            stack.clear();

            String inputBracket = input.readLine();
            brackets.add(inputBracket);

            for (int j = 0; j < inputBracket.length(); j++) {
                if (inputBracket.charAt(j) == '(') {
                    stack.push('(');
                } else {
                    if (stack.isEmpty()) {
                        isVPS = false;
                        break;
                    } else {
                        stack.pop();
                    }
                }
            }

            if (!stack.isEmpty()) answer += "NO\n";
            else if (isVPS) answer += "YES\n";
            else answer += "NO\n";
        }

        System.out.println(answer);
        input.close();
    }
}
