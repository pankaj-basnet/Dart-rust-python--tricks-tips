from typing import List, Optional, TypedDict, Dict

print("==========================================")


# --- MOCK CLASSES TO SIMULATE WGER STRUCTURE ---
class Translation:
    def __init__(self, name):
        self.name = name


class ExerciseObj:
    def __init__(self, name):
        self.name = name

    def get_translation(self, lang):
        return Translation(self.name)


class Entry:
    def __init__(self, exercise_id, name):
        self.exercise_id = exercise_id
        self.exercise_obj = ExerciseObj(name)


class Slot:
    def __init__(self, entries: List[Entry]):
        self.entries = entries


# --- THE ALGORITHM ---


class SlotGroupInfo(TypedDict):
    groupSize: int
    indexInGroup: int
    exerciseName: Optional[str]


def compute_slot_groups(
    slots: List[Slot], language_code: str
) -> Dict[int, SlotGroupInfo]:
    result: Dict[int, SlotGroupInfo] = {}
    i = 0
    print(f"--- Starting Grouping Logic for {len(slots)} slots ---")

    while i < len(slots):
        slot = slots[i]

        # 1. Check for single entry
        if len(slot.entries) != 1:
            print(f"[Index {i}] Found a Superset/Empty slot. Skipping grouping.")
            result[i] = {"groupSize": 1, "indexInGroup": 0, "exerciseName": None}
            i += 1
            continue

        exercise_id = slot.entries[0].exercise_id
        print(
            f"[Index {i}] Found single entry: {slot.entries[0].exercise_obj.name} (ID: {exercise_id})"
        )

        # 2. Look ahead to find consecutive matches
        j = i + 1
        while (
            j < len(slots)
            and len(slots[j].entries) == 1
            and slots[j].entries[0].exercise_id == exercise_id
        ):
            print(f"  > Index {j} matches! Extending group...")
            j += 1

        group_size = j - i
        print(f"  > Group size determined: {group_size}")

        # 3. Get name only if it's a real group
        exercise_name = None
        if group_size > 1:
            exercise_name = (
                slot.entries[0].exercise_obj.get_translation(language_code).name
            )

        # 4. Fill result and print state
        for k in range(i, j):
            result[k] = {
                "groupSize": group_size,
                "indexInGroup": k - i,
                "exerciseName": exercise_name,
            }
            print(f"     Recorded result[{k}]: indexInGroup={k-i}")

        # 5. Jump to next unprocessed slot
        print(f"  > Jumping pointer 'i' from {i} to {j}\n")
        i = j

    return result


# --- TEST EXECUTION ---

# Let's create a workout: 2 Squats, 1 Superset, 1 Bench Press
test_slots = [
    Slot([Entry(101, "Squat")]),  # Index 0
    Slot([Entry(101, "Squat")]),  # Index 1
    Slot([Entry(102, "Bench"), Entry(103, "Row")]),  # Index 2 (Superset)
    Slot([Entry(104, "Deadlift")]),  # Index 3
]

final_map = compute_slot_groups(test_slots, "en")

print("--- FINAL RESULT MAP ---")
for idx, info in final_map.items():
    print(f"Slot {idx}: {info}")
