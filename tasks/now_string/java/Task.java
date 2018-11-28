import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class Task {
  public static void main(String[] args) {
    final String f = "yyyy-MM-dd'T'HH:mm:ss.000000000'Z'";
    final TimeZone tz = TimeZone.getTimeZone("UTC");
    final DateFormat df = new SimpleDateFormat(f);
    df.setTimeZone(tz);
    Date d = new Date();
    String s = df.format(d);
    System.out.println(s);
  }
}
