#[derive(Debug, Clone)]
pub struct Category {
    pub id: i32,
    pub name: String,
    pub parent_id: Option<i32>,
}

pub fn run() {
    let categories = vec![
        Category { id: 1, name: "Fruit".to_string(), parent_id: None },
        Category { id: 2, name: "Veg".to_string(), parent_id: Some(1) },
        Category { id: 3, name: "Dairy".to_string(), parent_id: None },
    ];

    // The order requested by the UI/Frontend
    let new_order_ids = vec![3, 1]; 

    let reordered = reorder_by_id_list(categories, new_order_ids);

    println!("Reordered Categories: {:?}", reordered);
}

fn reorder_by_id_list(categories: Vec<Category>, id_list: Vec<i32>) -> Vec<Category> {
    let mut result = Vec::new();

    // Map existing categories for quick lookup
    for id in id_list {
        if let Some(cat) = categories.iter().find(|c| c.id == id) {
            result.push(cat.clone());
        }
    }
    result
}
