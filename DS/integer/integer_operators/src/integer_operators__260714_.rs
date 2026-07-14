fn calculate_volume(weight: i32, reps: i32) -> i32 {
    weight * reps
}

pub fn process_gym_log() {
    let weight = 20;
    let reps = 10;

    let volume = calculate_volume(weight, reps);

    if volume > 0 {
        println!("Volume calculated: {}", volume)
    } else {
        println!("Invalid log detected")
    }
}

// fn calculate_volume(weight: i32, reps: i32) -> i32 {
// weight * reps // Return total volume (weight * reps)
// }

// fn process_log() {
// let weight = 100; // From wger Log: weight attribute
// let reps = 3;     // From wger Log: repetitions attribute

// ```
// let vol = calculate_volume(weight, reps); // Perform calculation

// if vol > 0 {
//     println!("Volume calculated: {}", vol);
// } else {
//     println!("Invalid load detected");
// }
