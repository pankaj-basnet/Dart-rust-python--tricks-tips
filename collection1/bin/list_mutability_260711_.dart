class Category {
  final int id;
  final int? parentId;
  final String name;

  Category(this.id, this.name, {this.parentId});

  @override
  String toString() => name;
}

void main() async {
  var state = [
    Category(1, 'Fruit'),
    Category(2, 'Veg', parentId: 1),
    Category(3, 'Dairy'),
  ];

  // Logic
  int oldIndex = 0; // Move Fruit
  int newIndex = 1;

  final reordered = state.where((c) => c.parentId == null).toList();
  print("Before Reordered: $reordered");

  final moved = reordered.removeAt(oldIndex);
  reordered.insert(newIndex, moved);

  print("After Reordered: $reordered");
}

// -- OUTPUT --
// Before Reordered: [Fruit, Dairy]
// After Reordered: [Dairy, Fruit]
