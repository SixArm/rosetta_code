# Epoch string

Task: Print the current Unix epoch timestamp in seconds.

Task code conventions:

  * `f` is the format string, typically a constant.
  * `t` is the time, typically a variable.
  * `s` is the string, typically what we print.


## Rust

```rust
use std::time::SystemTime;

fn main() {
    match SystemTime::now().duration_since(SystemTime::UNIX_EPOCH) {
        Ok(n) => println!("{}", n.as_secs()),
	Err(_) => panic!("SystemTime before UNIX EPOCH!"),
    }
}
```
