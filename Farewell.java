import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;

public class Farewell {
    private static final String KEY = "i hope in the next ten years there would be no other farewell letter brilliant than this one";

    private static String[] readConent(String file) throws Exception {
        FileInputStream fis = new FileInputStream(new File(file));
        BufferedReader br = new BufferedReader(new InputStreamReader(fis));
        StringBuilder sb = new StringBuilder();

        String line = null;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        return sb.toString().replaceAll("\\s", "").split(",");
    }

    public static void main(String[] args) throws Exception {
        String[] encrypted = readConent(args[0]);
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < encrypted.length; ++i) {
            sb.append((char) (Integer.parseInt(encrypted[i]) ^ KEY.charAt(i % KEY.length())));
        }

        System.out.print(sb);
    }
}
