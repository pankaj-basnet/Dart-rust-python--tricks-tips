#[derive(Debug)]
struct Category { id: i32, name: String, parent_id: Option<i32> }

fn main() {
    let mut categories = vec![
        Category { id: 1, name: "Fruit".to_string(), parent_id: None },
        Category { id: 2, name: "Veg".to_string(), parent_id: Some(1) },
        Category { id: 3, name: "Dairy".to_string(), parent_id: None },
    ];

    let old_index = 0;
    let new_index = 1;

    let mut reordered: Vec<Category> = categories.into_iter()
        .filter(|c| c.parent_id.is_none())
        .collect();

    if old_index < reordered.len() && new_index < reordered.len() {
        let moved = reordered.remove(old_index);
        reordered.insert(new_index, moved);
    }

    println!("Reordered: {:?}", reordered);
}