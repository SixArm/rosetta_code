extern crate chrono;
use chrono::prelude::*;

fn main() {
    let f = "%Y-%m-%dT%H:%M:%S.%fZ";
    let d: DateTime<Utc> = Utc::now();
    let s = d.format(f);
    println!("{}", s); 
}
