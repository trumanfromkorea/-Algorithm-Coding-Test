# Java CheatSheet

## 입출력

class 에 `throws IOException` 을 추가해줍니다.

```java
import java.io.*

// 입력
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
String input = br.readLine();

br.close();

// 출력
BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));   
String output = "Hello world";

bw.write(output);
bw.flush();
bw.close();
```