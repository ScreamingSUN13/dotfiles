// Test script for syntax highlighting
struct Animal {
    species: String,
}

impl Animal {
    fn new(species: &str) -> Self {
        Animal { species: species.to_string() }
    }
}

fn main() {
    let nums: Vec<i32> = vec![1, 2, 3];
    for n in &nums {
        if n % 2 == 0 {
            println!("Value: {}", n);
        }
    }
}
