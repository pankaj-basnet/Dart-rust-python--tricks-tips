// practice_1_structs.rs

// 1. Define the Sort Condition Enum
// In the report: "Ascending (0), Descending (1)"
#[derive(Debug, Clone, Copy)]
pub enum SortConditionPB {
    Ascending = 0,
    Descending = 1,
}

// 2. Define the basic Sort Protocol Buffer struct
// In the report: "id, field_id, condition"
#[derive(Debug, Clone)]
pub struct SortPB {
    pub id: String,
    pub field_id: String,
    pub condition: SortConditionPB,
}

// 3. Define the Sort with Index (for ordered lists)
// In the report: "Combines index (u32) and sort (SortPB)"
#[derive(Debug, Clone)]
pub struct SortWithIndexPB {
    pub index: u32,
    pub sort: SortPB,
}

// 4. Define the Payload used to request an update
// In the report: "view_id, field_id, condition, optional sort_id"
#[derive(Debug)]
pub struct UpdateSortPayloadPB {
    pub view_id: String,
    pub field_id: String,
    pub condition: SortConditionPB,
    pub sort_id: Option<String>, // 'Option' handles nullable fields in Rust
}

fn main() {
    // PRACTICE: Create an instance of a Sort payload
    let payload = UpdateSortPayloadPB {
        view_id: String::from("view_123"),
        field_id: String::from("due_date_column"),
        condition: SortConditionPB::Descending,
        sort_id: None, // No existing sort ID provided
    };

    println!("Created Payload: {:?}", payload);
    
    // PRACTICE CHALLENGE:
    // Try creating a 'SortWithIndexPB' instance where index is 0 
    // and the inner sort has id "sort_ABC" and condition Ascending.
}