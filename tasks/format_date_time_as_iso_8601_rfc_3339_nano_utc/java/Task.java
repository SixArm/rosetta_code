import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class Task {
  public static void main(String[] args) {
    final String iso = "yyyy-MM-dd'T'HH:mm:ss.000000000'Z'";
    final TimeZone tz = TimeZone.getTimeZone("UTC");
    final DateFormat df = new SimpleDateFormat(iso);
    df.setTimeZone(tz);
    String s = df.format(new Date());
    System.out.println(s);
  }
}
