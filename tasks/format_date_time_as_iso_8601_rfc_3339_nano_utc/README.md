# Task: Format date time as ISO 8601 RFC 3339 UTC

Task: forrmat a date and time as a string.

  * Using the format "YYYY-MM-DDT00:00:00.000000000Z"
  * Using the ISO 8601 format
  * Using the RFC 3339 format
  * Using the UTC time zone
  * Using nanoseconds or zeros

Task code conventions:

  * `f` is the format string, typically a constant.
  * `t` is the time, typically a variable.
  * `s` is the string, which we print to standard output.


## C 

ANSI:

```c
#include <stdio.h>
#include <time.h>

int main()
{
    time_t timer;
    char s[30];
    struct tm* tm_info;

    time(&timer);
    tm_info = localtime(&timer);

    strftime(s, 30, "%Y-%m-%d %H:%M:%S.000000000Z", tm_info);
    puts(s);

    return 0;
}
```


## Go

```go
package main

import "fmt"
import "time"

func main() {
    const f = "2006-01-02T15:04:05.999999999Z"
    t := time.Now().UTC()
    s := t.Format(f)
    fmt.Println(s)
}
```


## Java

```java
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
```


## JavaScript

```js
let t = new Date();
let s = now.toISOString();
console.log(s);
```


## Perl

With POSIX:

```perl
use POSIX;
my $f = "%Y-%m-%dT%H:%M:%S.000000000Z";
my $t = time();
my $s = strftime($f, gmtime($t);
print $s, "\n";
```

With CPAN:

```perl
use DateTime;
my $t = DateTime->now()
$now->iso8601().'Z';
```


## Python

```python
import datetime
f = "%Y-%m-%dT%H:%M:%S.%f000Z"
t = datetime.datetime.utcnow()
s = t.strftime(f)
print(s)
```


## Ruby

```ruby
f = "%Y-%m-%dT%H:%M:%S.%NZ"
t = Time.now.utc.strftime(f)
puts t
```
