pub fn run() {
    println!("---- string_concatenation -----");
    println!("{}", format_measurement(120.0, "mmHg"));
}

fn format_measurement(value: f64, unit: &str) -> String {
    format!("{} {}", value, unit)
}
