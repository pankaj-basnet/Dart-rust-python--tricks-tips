# D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\z--rust-programming-language-\dictionary__111aaa__.py
# Concepts/dict/dictionary__111aaa__.py


print("🚀 ================= START NUTRITION APP LOGIC ================= 🚀")
print("🚀 ================= START NUTRITION APP LOGIC ================= 🚀")
print("🚀 ================= START NUTRITION APP LOGIC ================= 🚀")
print("🚀 ================= START NUTRITION APP LOGIC ================= 🚀")

print("🚀 ================= START NUTRITION APP LOGIC ================= 🚀")

# 🥗 Descriptive list naming for better context
nutrition_data_records = [
    {"tile": "🍳 Breakfast Plan", "subtitle": "High protein, low carb (08:00 AM)", "icon": "fastfood"},
    {"tile": "🍌 Post-Workout", "subtitle": "Whey protein & Banana (10:30 AM)", "icon": "fitness_center"},
    {"tile": "🥗 Lunch Menu", "subtitle": "Grilled chicken with Quinoa (01:30 PM)", "icon": "restaurant"},
]

print(f"📦 Raw Dictionary List: {nutrition_data_records}")

print("------------------- 📂 LOOPING THROUGH RECORDS -------------------")

for record in nutrition_data_records:
    print(f"🍴 Item: {record}")
    print("✨ --------------")

print("------------------- 🔢 ACCESSING BY INDEX -------------------")

for index in range(0, len(nutrition_data_records)):
    print(f"📍 Position {index}: {nutrition_data_records[index]}")
    print(f"📝 Title: {nutrition_data_records[index]['tile']}")
    print("✨ --------------")

print("------------------- 🏗️ OBJECT-ORIENTED APPROACH -------------------")

class NutritionPlan:
    """Blueprint for a Nutrition Card in the Flutter App"""
    def __init__(self, title_label, subtitle_text, icon_identifier):
        self.title = title_label
        self.subtitle = subtitle_text
        self.icon = icon_identifier

    def __str__(self):
        return f"🆔 {self.title} | 📝 {self.subtitle} | 🖼️ {self.icon}"

# 💧 Standalone object for testing
hydration_entry = NutritionPlan(
    title_label="💧 Morning Hydration", 
    subtitle_text="500ml Water with Lemon", 
    icon_identifier="water_drop"
)
print(f"✅ Created Object: {hydration_entry}")

processed_plan_objects = [hydration_entry]

print("------------------- 🔄 MAPPING DATA TO OBJECTS -------------------")

for index in range(1, len(nutrition_data_records)):
    # Creating a structured object from raw dictionary data
    mapped_plan = NutritionPlan(
        title_label=nutrition_data_records[index]["tile"],
        subtitle_text=nutrition_data_records[index]["subtitle"],
        icon_identifier=nutrition_data_records[index]["icon"],
    )
    print(f"💎 New Object: {mapped_plan}")
    
    processed_plan_objects.append(mapped_plan)
    print(f"📋 Total Objects Tracked: {len(processed_plan_objects)}")
    print("✨ -------------")

print("🏁 ================= END OF PRACTICE FILE ================= 🏁")

