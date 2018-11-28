# ZID string

A ZID is a secure random number.

A ZID is represented as a string, hexadecimal lowercase, such as "692dff7b74575a61f2b375b1c7d824cf".

A ZID is similar to a UUID (Universally Unique Identifier).

A ZID can be better than a UUID because a ZID is can be faster, easier, more secure, and more sharable.

ZID specification:

  * Generate all bits using a secure random generator.
  * Generate as many bits as you like.
  * Describe the ZID by appending the number of bits, for example ZID-128 means 128 bits.
  * A ZID string representation is all hexadecimal, all lowercase, i.e. all using digits 0-9 and lowercase a-f.


## C with libsodium

```c
#include <sodium.h>
int main(void)
{
  if (sodium_init() < 0) { exit(1); }
  unsigned int buf_len = 16;
  unsigned char buf[buf_len];
  unsigned int hex_len = buf_len * 2 + 1;
  char hex[hex_len];
  randombytes_buf(buf, buf_len);
  sodium_bin2hex(hex, hex_len, buf, buf_len);
  puts(hex);
}
```


## JavaScript with libsodium

```js
const _sodium = require('libsodium-wrappers');
(async() => {
  await _sodium.ready;
  const sodium = _sodium;
  var buf = sodium.randombytes_buf(16);
  var str = sodium.to_hex(buf);
  console.log(str);
})();
```


## Ruby

```ruby
require 'securerandom'
puts SecureRandom.hex(16)
```


## Shell

```sh
hexdump -n 16 -v -e '/1 "%02x"' -e "/16 \"\n\"" /dev/urandom
```


## Rust

```rust
extern crate hex;
extern crate rand;

use hex::ToHex;
use rand::rngs::OsRng;
use rand::RngCore;

fn main() {
    // because `OsRng` opens files, it may fail
    let mut rng = match OsRng::new() {
        Ok(v) => v,
        Err(e) => panic!("Failed to obtain OS RNG: {}", e)
    };
    let mut bytes = [0u8; 16];
    rng.try_fill_bytes(&mut bytes).unwrap();
    let mut s = String::new();
    bytes.write_hex(&mut s).unwrap();

    println!("{}", s);
}
```


## Swift

```swift
import Foundation
import Security

public class ZID : NSData {

  public static func create(count: Int) -> NSData {
    var bytes = [UInt8](count: count/8, repeatedValue: 0)
    SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
    return NSData(bytes: &bytes, length: bytes.count)
  }

  public static func toString(data: NSData) -> String {
    return
      UnsafeBufferPointer<UInt8>(
        start: UnsafePointer(data.bytes),
        count: data.length
        ).map {
          String(format: "%02x", $0)
        }.joinWithSeparator("")
  }

}
```
