
import java.util.*;

class Solution {
    private boolean[] visited;

    private ArrayList<ArrayList<Integer>> listGraph = new ArrayList<>();

    private ArrayList<Integer> distanceList = new ArrayList<>();

    public int solution(int n, int[][] edge) {

        initGraph(n);
        generateGraph(n,edge);
        BFS(n,0);

        return findMaxCount();
    }

    int findMaxCount() {
        int max = Collections.max(this.distanceList);
        int count = Collections.frequency(this.distanceList, max);

        return count;
    }

    void generateGraph(int n, int[][] edge) {
        this.visited = new boolean[n];

        for (int[] e : edge) {
            int i = e[0] - 1;
            int j = e[1] - 1;

            this.listGraph.get(i).add(j);
            this.listGraph.get(j).add(i);
        }
    }

    void initGraph(int n) {
        for (int i =0 ;i < n ; i++){
            this.listGraph.add(new ArrayList<>());
        }
    }

    void BFS(int n, int x) {
        Queue<Integer> queue = new LinkedList<>();
        Queue<Integer> distance = new LinkedList<>();

        this.visited[x] = true;

        queue.add(x);
        distance.add(0);

        while (!queue.isEmpty()) {
            int now = queue.poll();
            int dist = distance.poll();

            this.distanceList.add(dist);

            for (int i = 0; i < this.listGraph.get(now).size(); i++) {
                int next = this.listGraph.get(now).get(i);

                if (!visited[next]) {
                    this.visited[next] = true;
                    queue.add(next);
                    distance.add(dist + 1);
                }
            }

        }
    }
}
