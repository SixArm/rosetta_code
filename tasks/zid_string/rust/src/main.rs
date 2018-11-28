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
