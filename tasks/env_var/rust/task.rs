use std::env;

fn main() {
   let s = env::var("EXAMPLE");
   println!("{}", s);
}
