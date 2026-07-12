mod reorder_list_elements_categories;
#[derive(Debug)]


struct Category { id: i32, name: String, parent_id: Option<i32> }

fn main() {
   
   
    println!("--- Running Reorder Practice ---");

    reorder_list_elements_categories::run();
}
