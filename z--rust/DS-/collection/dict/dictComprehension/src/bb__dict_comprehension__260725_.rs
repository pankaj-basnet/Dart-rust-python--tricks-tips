pub fn run() {
    println!("------------------");

    let category = vec!["fruit", "Veg", "Dairy"];

    println!("{:?}", category);

    println!("------------------");

    let category_mapped: std::collections::HashMap<&str, &str> =
        category.iter().map(|&cat| (cat, "cat")).collect();

    println!("{:?}", category_mapped);
    println!("------------------");
}

// OUTPUT

// ["fruit", "Veg", "Dairy"]
// ------------------
// {"fruit": "cat", "Veg": "cat", "Dairy": "cat"}
