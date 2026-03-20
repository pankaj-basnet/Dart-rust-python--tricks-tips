import 'package:dict__class__260320/dict__class__260320.dart'
    as dict__class__260320;


void main() {
  print("🚀 ================= START NUTRITION APP LOGIC ================= 🚀");

  // 🥗 List of Maps (Using camelCase for Dart standards)
  List<Map<String, String>> nutritionDataRecords = [
    {"tile": "🍳 Breakfast Plan", "subtitle": "High protein, low carb (08:00 AM)", "icon": "fastfood"},
    {"tile": "🍌 Post-Workout", "subtitle": "Whey protein & Banana (10:30 AM)", "icon": "fitness_center"},
    {"tile": "🥗 Lunch Menu", "subtitle": "Grilled chicken with Quinoa (01:30 PM)", "icon": "restaurant"},
  ];

  print("📦 Raw Map List: $nutritionDataRecords");

  print("------------------- 📂 LOOPING THROUGH RECORDS -------------------");

  for (var record in nutritionDataRecords) {
    print("🍴 Item: $record");
    print("✨ --------------");
  }

  print("------------------- 🔢 ACCESSING BY INDEX -------------------");

  for (int index = 0; index < nutritionDataRecords.length; index++) {
    print("📍 Position $index: ${nutritionDataRecords[index]}");
    print("📝 Title: ${nutritionDataRecords[index]['tile']}");
    print("✨ --------------");
  }

  print("------------------- 🏗️ OBJECT-ORIENTED APPROACH -------------------");

  NutritionPlan hydrationEntry = NutritionPlan(
    titleLabel: "💧 Morning Hydration", 
    subtitleText: "500ml Water with Lemon", 
    iconIdentifier: "water_drop"
  );
  
  print("✅ Created Object: $hydrationEntry");

  List<NutritionPlan> processedPlanObjects = [hydrationEntry];

  print("------------------- 🔄 MAPPING DATA TO OBJECTS -------------------");

  for (int index = 1; index < nutritionDataRecords.length; index++) {
    NutritionPlan mappedPlan = NutritionPlan(
      titleLabel: nutritionDataRecords[index]['tile'] ?? "",
      subtitleText: nutritionDataRecords[index]['subtitle'] ?? "",
      iconIdentifier: nutritionDataRecords[index]['icon'] ?? "",
    );
    
    print("💎 New Object: $mappedPlan");
    processedPlanObjects.add(mappedPlan);
    print("📋 Total Objects Tracked: ${processedPlanObjects.length}");
    print("✨ -------------");
  }

  print("🏁 ================= END OF PRACTICE FILE ================= 🏁");
}

class NutritionPlan {
  final String title;
  final String subtitle;
  final String icon;

  // Constructor with descriptive named parameters
  NutritionPlan({
    required String titleLabel, 
    required String subtitleText, 
    required String iconIdentifier
  }) : this.title = titleLabel,
       this.subtitle = subtitleText,
       this.icon = iconIdentifier;
  // Unnecessary 'this.' qualifier.
  
  @override
  String toString() {
    return "🆔 $title | 📝 $subtitle | 🖼️ $icon";
  }
}
