import java.io.*;
import java.util.StringTokenizer;

public class Main {

    private static int n;
    private static int m;

    private static boolean[] visited;
    private static int[][] graph;
    private static int[] plan;

    public static void main(String[] args) throws IOException, NumberFormatException {
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter output = new BufferedWriter(new OutputStreamWriter(System.out));

        StringTokenizer st;

        boolean answer = true;

        n = Integer.parseInt(input.readLine());
        m = Integer.parseInt(input.readLine());

        visited = new boolean[n];

        graph = new int[n][n];
        plan = new int[m];

        for (int i = 0; i < n; i++) {
            st = new StringTokenizer(input.readLine());
            for (int j = 0; j < n; j++) {
                graph[i][j] = Integer.parseInt(st.nextToken());
            }
        }

        st = new StringTokenizer(input.readLine());
        for (int i = 0; i < m; i++) {
            plan[i] = Integer.parseInt(st.nextToken());
        }

        DFS(plan[0] - 1);

        for (int p : plan) {
            if (p > 0 && !visited[p - 1]) {
                answer = false;
                break;
            }
        }

        output.write(answer ? "YES" : "NO");

        output.flush();
        output.close();
        input.close();
    }

    public static void DFS(int x) {
        visited[x] = true;

        for (int i = 0; i < n; i++) {
            if (graph[x][i] == 1 && !visited[i]) {
                DFS(i);
            }
        }
    }
}
