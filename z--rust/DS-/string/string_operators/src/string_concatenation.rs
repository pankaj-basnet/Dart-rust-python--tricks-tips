pub fn run() {
    println!("---- string_concatenation -----");
    println!("{}", format_measurement(120.0, "mmHg"));
}

fn format_measurement(value: f64, unit: &str) -> String {
    format!("{} {}", value, unit)
}

// OUTPUT:
// -------- main --------
// ---- string_concatenation -----
// 120 mmHg

// repo link in github is
// https://github.com/pankaj-basnet/Dart-rust-python--tricks-tips/blob/main/z--rust/DS-/string/string_operators/src/string_concatenation.rs