void main(List<String> arguments) {
  print('------------------');

  List<String> category = ['fruit', 'Veg', 'Dairy'];

  print(category);

  print('------------------');

  Map<String, String> categoryMapped = {
    for (final cat in category) cat: 'cat',
  };
  print(categoryMapped);

  print('------------------');

  // OUTPUT
  // [fruit, Veg, Dairy]
  // ------------------
  // {fruit: cat, Veg: cat, Dairy: cat}
}
