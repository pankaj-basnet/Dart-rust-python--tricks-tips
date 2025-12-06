// practice_3_traits.rs

// 1. The "Protocol Buffer" struct (The external contract)
#[derive(Debug)]
struct SortPB {
    id: String,
    field_id: String,
}

// 2. The "Internal Domain" struct (The logic inside Rust)
// This represents the "Sort" struct mentioned in section 2.2
struct Sort {
    internal_uuid: String,
    column_name: String,
    // Internal structs might have fields we don't send to Dart
    created_at_timestamp: u64, 
}

// 3. Implement the Conversion
// In the report: "The From trait defines exactly how to convert... internal Sort into SortPB"
impl From<Sort> for SortPB {
    fn from(item: Sort) -> Self {
        SortPB {
            // usage of .clone() because strings own memory
            id: item.internal_uuid.clone(), 
            field_id: item.column_name.clone(),
        }
    }
}

fn main() {
    // 1. Create the internal database object
    let internal_data = Sort {
        internal_uuid: String::from("uuid-555-666"),
        column_name: String::from("Status"),
        created_at_timestamp: 1622543200,
    };

    // 2. Convert it using .into()
    // Rust infers we want SortPB because of the type annotation on 'external_dto'
    let external_dto: SortPB = internal_data.into();

    println!("Converted for Dart: {:?}", external_dto);
    
    // Note: 'external_dto' now has the data, but 'internal_data.created_at_timestamp' was dropped 
    // because it wasn't part of the SortPB definition.
}