# Task: Zid secure random hexadecimal 32 character text

Zid stands for "Zen identifier":

  * A Zen identifier is a secure random number, represented as text, such as "692dff7b74575a61f2b375b1c7d824cf".

  * A Zen identifier is similar to a random UUID (Universally Unique Identifier).

  * A Zen identifier can be better than a UUID because a Zen indentifier is often faster, easier, more secure, and more sharable.

Zid specification:

  * Generate all bits using a secure random generator.
  * Generate as many bits as you like.
  * Describe the Zid by appending the number of bits, for example Zid-128 means 128 bits.
  * A Zid string representation is all hexadecimal, all lowercase, using digits 0-9 and lowercase a-f.


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
