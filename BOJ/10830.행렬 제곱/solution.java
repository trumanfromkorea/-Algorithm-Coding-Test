
import java.io.*;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException, NumberFormatException {
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter output = new BufferedWriter(new OutputStreamWriter(System.out));

        StringTokenizer tokenizer = new StringTokenizer(input.readLine());

        int n = Integer.parseInt(tokenizer.nextToken());
        long square = Long.parseLong(tokenizer.nextToken());

        int[][] matrix = new int[n][n];
        int[][] odd = new int[n][n];
        boolean isOddEmpty = true;

        for (int i = 0; i < n; i++) {
            tokenizer = new StringTokenizer(input.readLine().trim());
            for (int j = 0; j < n; j++) {
                matrix[i][j] = Integer.parseInt(tokenizer.nextToken());
            }
        }

        while (square > 1) {
            if (square % 2 == 1) {
                if (isOddEmpty) {
                    odd = matrix;
                    isOddEmpty = false;
                } else {
                    odd = multiple(matrix, odd, n);
                }
            }

            matrix = multiple(matrix, matrix, n);
            square /= 2;
        }

        if (isOddEmpty) {
            printMatrix(matrix, n, output);
        } else {
            matrix = multiple(matrix, odd, n);
            printMatrix(matrix, n, output);
        }


        input.close();
        output.flush();
        output.close();
    }

    public static int[][] multiple(int[][] matrix_01, int[][] matrix_02, int n) {
        int[][] result = new int[n][n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    result[i][j] += matrix_01[i][k] * matrix_02[k][j];
                    result[i][j] %= 10000;
                }
            }
        }

        return result;
    }

    public static void printMatrix(int[][] matrix, int n, BufferedWriter output) throws IOException {
        for (int i = 0; i < n; i++) {
            String line = "";
            for (int j = 0; j < n; j++) {
                output.write(matrix[i][j] % 1000 + " ");
            }
            output.write("\n");
        }
    }
}
