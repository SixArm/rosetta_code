# Now string

Task: Print the current date and time using a specific format.

  * Use the format "YYYY-MM-DDT00:00:00.000000000Z"
  * Use the ISO 8601 standard and the RFC 3339 standard
  * Use the UTC time zone and the "Z" suffix
  * Use the nanoseconds format i.e. nine decimal seconds

Task code conventions:

  * `f` is the format string, typically a constant.
  * `t` is the time, typically a variable.
  * `s` is the string, typically what we print.


## C 

ANSI:

```c
#include <stdio.h>
#include <time.h>
...
time_t timer;
char s[30];
struct tm* tm_info;

time(&timer);
tm_info = localtime(&timer);

strftime(s, 30, "%Y-%m-%d %H:%M:%S.000000000Z", tm_info);
```


## Elixir

Elixir with default precision:

```
s = DateTime.utc_now() |> DateTime.to_iso8601()
```

Elixir with nanosecond format:

```elixir
f = "~4..0B-~2..0B-~2..0BT~2..0B:~2..0B:~2..0B.~6..0B000Z"
d = DateTime.utc_now()
s = :io_lib.format(f, [d.year, d.month, d.day, d.hour, d.minute, d.second, elem(d.microsecond, 0)]) |>
IO.iodata_to_binary
```

## Go

```go
import "time"
...
const f = "2006-01-02T15:04:05.999999999Z"
t := time.Now().UTC()
s := t.Format(f)
```


## Java

```java
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
...
final String f = "yyyy-MM-dd'T'HH:mm:ss.000000000'Z'";
final TimeZone tz = TimeZone.getTimeZone("UTC");
final DateFormat df = new SimpleDateFormat(f);
df.setTimeZone(tz);
Date d = new Date();
String s = df.format(d);
```


## JavaScript

```js
let t = new Date();
let s = now.toISOString();
```


## Perl

Perl with POSIX:

```perl
use POSIX;
my $f = "%Y-%m-%dT%H:%M:%S.000000000Z";
my $t = time();
my $s = strftime($f, gmtime($t);
```

Perl with CPAN:

```perl
use DateTime;
my $t = DateTime->now();
my $s = $now->iso8601().'Z';
```


## Python

```python
import datetime
f = "%Y-%m-%dT%H:%M:%S.%f000Z"
t = datetime.datetime.utcnow()
s = t.strftime(f)
```


## Ruby

```ruby
f = "%Y-%m-%dT%H:%M:%S.%NZ"
t = Time.now.utc
s = t.strftime(f)
```


## Rust

```rust
extern crate chrono;
use chrono::prelude::*;
...
let f = "%Y-%m-%dT%H:%M:%S.%fZ";
let d: DateTime<Utc> = Utc::now();
let s = d.format(f);
```