// practice_2_methods.rs

// --- Context Setup (Simplified from File 1) ---
#[derive(Debug, Clone)]
pub struct SortPB { id: String } // Simplified for this exercise
#[derive(Debug, Clone)]
pub struct SortWithIndexPB { index: u32 } // Simplified

// --- The Core Struct ---
// In the report: "view_id, insert_sorts, delete_sorts, update_sorts"
#[derive(Debug)]
pub struct SortChangesetNotificationPB {
    pub view_id: String,
    pub insert_sorts: Vec<SortWithIndexPB>,
    pub delete_sorts: Vec<SortPB>,
    pub update_sorts: Vec<SortPB>,
}

impl SortChangesetNotificationPB {
    // 1. The Constructor
    // In the report: "creates an empty notification for a specific view"
    pub fn new(view_id: String) -> Self {
        Self {
            view_id,
            insert_sorts: Vec::new(),
            delete_sorts: Vec::new(),
            update_sorts: Vec::new(),
        }
    }

    // 2. The Check
    // In the report: "checks if there are actually any changes"
    pub fn is_empty(&self) -> bool {
        self.insert_sorts.is_empty() 
        && self.delete_sorts.is_empty() 
        && self.update_sorts.is_empty()
    }

    // 3. The Merge Logic
    // In the report: "merges two notifications together... batch them into one"
    pub fn extend(&mut self, other: SortChangesetNotificationPB) {
        // We append the vectors from 'other' into 'self'
        self.insert_sorts.extend(other.insert_sorts);
        self.delete_sorts.extend(other.delete_sorts);
        self.update_sorts.extend(other.update_sorts);
    }
}

fn main() {
    // 1. Create a notification
    let mut notification_batch = SortChangesetNotificationPB::new(String::from("view_main"));
    
    println!("Is batch empty? {}", notification_batch.is_empty()); // Should be true

    // 2. Create a second notification with some dummy data
    let incoming_event = SortChangesetNotificationPB {
        view_id: String::from("view_main"),
        insert_sorts: vec![SortWithIndexPB { index: 1 }],
        delete_sorts: vec![],
        update_sorts: vec![],
    };

    // 3. Merge them
    println!("Merging incoming event...");
    notification_batch.extend(incoming_event);

    println!("Is batch empty now? {}", notification_batch.is_empty()); // Should be false
    println!("Batch contents: {:?}", notification_batch);
}