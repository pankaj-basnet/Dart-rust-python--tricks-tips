



----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------
----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------
----------------------------------------------------------------


create 10 basic string/string_slice and basic dart function code  questions/answers style (with one mcq question/answers ) for each problem in each dart file, for rust practice  in dart cli create  app , for interns algorithm practice for internship job.

----------------------------------------------------------------




----------------------------------------------------------------






Here is a ready-to-use template for your Dart CLI algorithm practice app, designed specifically to help interns transition from Dart to Rust concepts (focusing on string manipulation and slices).

Each file contains a **code problem**, a **step-by-step answer/solution**, and an **MCQ question with an answer key** designed to build intuition for Rust's string behavior (like `String` vs `&str`, UTF-8 byte indexing, and borrowing).

---

### File Structure Overview

Save these files in your `lib/problems/` directory within your Dart CLI application:

```text
lib/
  problems/
    problem_01.dart
    problem_02.dart
    ...
    problem_10.dart

```

---

### `problem_01.dart` — Basic String Slicing

```dart
// Problem 1: Extract First N Characters
// Rust Context: Slicing a string (&str[0..n]) requires understanding UTF-8 byte boundaries.

void runProblem01() {
  print('=== Problem 1: First N Characters ===');
  print('Problem: Write a function `firstNChars(String input, int n)` that returns the first N characters of a string.');
  print('Answer:\n');

  // Solution Code
  String firstNChars(String input, int n) {
    if (n >= input.length) return input;
    return input.substring(0, n);
  }

  // Demonstration
  String sample = "Rustacean";
  print('Input: "$sample", n = 4');
  print('Output: "${firstNChars(sample, 4)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: In Rust, what happens if you slice a String `&s[0..3]` where index 3 falls inside a multi-byte UTF-8 character?');
  print('A) It automatically rounds to the nearest character boundary.');
  print('B) The program panics at runtime.');
  print('C) It returns an empty string.');
  print('D) It returns a compile-time error.');
  print('Correct Answer: B) The program panics at runtime.');
}

```

---

### `problem_02.dart` — Reversing a String

```dart
// Problem 2: Reverse String
// Rust Context: Strings in Rust cannot be reversed by simple indexing due to variable-width UTF-8 encoding.

void runProblem02() {
  print('=== Problem 2: Reverse a String ===');
  print('Problem: Write a function `reverseString(String input)` that returns the string reversed.');
  print('Answer:\n');

  // Solution Code
  String reverseString(String input) {
    return input.split('').reversed.join('');
  }

  // Demonstration
  String sample = "ferris";
  print('Input: "$sample"');
  print('Output: "${reverseString(sample)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: Why is `.chars().rev().collect::<String>()` commonly used in Rust to reverse a string?');
  print('A) Because Rust strings do not support memory reallocation.');
  print('B) Because direct byte reversal can corrupt UTF-8 grapheme clusters.');
  print('C) Because Rust strings are immutable linked lists.');
  print('D) Because `String` does not implement the `Slice` trait.');
  print('Correct Answer: B) Because direct byte reversal can corrupt UTF-8 grapheme clusters.');
}

```

---

### `problem_03.dart` — Check Palindrome

```dart
// Problem 3: Palindrome Verification
// Rust Context: Comparing string slices using double-ended iterators.

void runProblem03() {
  print('=== Problem 3: Palindrome Check ===');
  print('Problem: Write a function `isPalindrome(String input)` that ignores case and checks if a string reads the same forward and backward.');
  print('Answer:\n');

  // Solution Code
  bool isPalindrome(String input) {
    String cleaned = input.toLowerCase();
    String reversed = cleaned.split('').reversed.join('');
    return cleaned == reversed;
  }

  // Demonstration
  String sample = "Racecar";
  print('Input: "$sample"');
  print('Output: ${isPalindrome(sample)}\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: Which Rust string type represents an owned, growable UTF-8 buffer?');
  print('A) &str');
  print('B) String');
  print('C) &'static str');
  print('D) Vec<char>');
  print('Correct Answer: B) String');
}

```

---

### `problem_04.dart` — Find First Word (String Slice Concept)

```dart
// Problem 4: Get First Word
// Rust Context: Returning a slice `&str` borrowed from an input string slice `&str`.

void runProblem04() {
  print('=== Problem 4: Get First Word ===');
  print('Problem: Write a function `getFirstWord(String input)` that extracts the first space-separated word.');
  print('Answer:\n');

  // Solution Code
  String getFirstWord(String input) {
    int spaceIndex = input.indexOf(' ');
    if (spaceIndex == -1) return input;
    return input.substring(0, spaceIndex);
  }

  // Demonstration
  String sample = "Hello borrow checker";
  print('Input: "$sample"');
  print('Output: "${getFirstWord(sample)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: In Rust, if a function signature is `fn first_word(s: &str) -> &str`, what does the returned slice borrow from?');
  print('A) Heap allocation');
  print('B) Global static memory');
  print('C) The input reference `s`');
  print('D) A newly allocated String buffer');
  print('Correct Answer: C) The input reference `s`');
}

```

---

### `problem_05.dart` — Count Character Occurrences

```dart
// Problem 5: Frequency Count
// Rust Context: Iterating over string scalar values via `.chars()`.

void runProblem05() {
  print('=== Problem 5: Count Character Occurrences ===');
  print('Problem: Write a function `countChar(String input, String target)` that returns how many times target appears.');
  print('Answer:\n');

  // Solution Code
  int countChar(String input, String target) {
    if (target.isEmpty) return 0;
    int count = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i] == target) count++;
    }
    return count;
  }

  // Demonstration
  String sample = "ownership and borrowing";
  print('Input: "$sample", target: "o"');
  print('Output: ${countChar(sample, "o")}\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: Which method on a Rust `&str` allows you to iterate over individual Unicode scalar values?');
  print('A) .bytes()');
  print('B) .chars()');
  print('C) .iter()');
  print('D) .split()');
  print('Correct Answer: B) .chars()');
}

```

---

### `problem_06.dart` — Truncate String with Ellipsis

```dart
// Problem 6: Safe Truncation
// Rust Context: Slicing strings conditionally without taking ownership.

void runProblem06() {
  print('=== Problem 6: Truncate String ===');
  print('Problem: Write `truncateString(String input, int maxLength)` to append "..." if length exceeds max.');
  print('Answer:\n');

  // Solution Code
  String truncateString(String input, int maxLength) {
    if (input.length <= maxLength) return input;
    return '${input.substring(0, maxLength)}...';
  }

  // Demonstration
  String sample = "Concurrency without data races";
  print('Input: "$sample", max: 11');
  print('Output: "${truncateString(sample, 11)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: What is the type of a string literal like `"hello"` in Rust?');
  print('A) String');
  print('B) &str');
  print('C) &'static str');
  print('D) Vec<u8>');
  print('Correct Answer: C) &\'static str');
}

```

---

### `problem_07.dart` — Remove Vowels

```dart
// Problem 7: String Filtering
// Rust Context: Constructing a new `String` from filtered iterator results.

void runProblem07() {
  print('=== Problem 7: Remove Vowels ===');
  print('Problem: Write `removeVowels(String input)` to eliminate all lowercase and uppercase vowels.');
  print('Answer:\n');

  // Solution Code
  String removeVowels(String input) {
    final vowels = RegExp(r'[aeiouAEIOU]');
    return input.replaceAll(vowels, '');
  }

  // Demonstration
  String sample = "Zero Cost Abstractions";
  print('Input: "$sample"');
  print('Output: "${removeVowels(sample)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: What happens when you convert a `&str` to a `String` using `.to_string()` in Rust?');
  print('A) A new heap memory allocation occurs.');
  print('B) It creates a pointer referencing the old string without allocation.');
  print('C) The original reference is dropped.');
  print('D) It converts ASCII characters to UTF-16.');
  print('Correct Answer: A) A new heap memory allocation occurs.');
}

```

---

### `problem_08.dart` — Check Substring Prefix (StartsWith Slice)

```dart
// Problem 8: Prefix Verification
// Rust Context: Prefix checking on slices without needing full string allocation.

void runProblem08() {
  print('=== Problem 8: Prefix Check ===');
  print('Problem: Write `hasPrefix(String input, String prefix)` using manual slice comparison.');
  print('Answer:\n');

  // Solution Code
  bool hasPrefix(String input, String prefix) {
    if (prefix.length > input.length) return false;
    return input.substring(0, prefix.length) == prefix;
  }

  // Demonstration
  String sample = "cargo build";
  print('Input: "$sample", prefix: "cargo"');
  print('Output: ${hasPrefix(sample, "cargo")}\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: Which slice method in Rust checks if a `&str` begins with a given prefix slice?');
  print('A) .contains()');
  print('B) .starts_with()');
  print('C) .matches()');
  print('D) .has_prefix()');
  print('Correct Answer: B) .starts_with()');
}

```

---

### `problem_09.dart` — Capitalize Every Word

```dart
// Problem 9: Title Case Conversion
// Rust Context: String mutations and allocation vs working in place.

void runProblem09() {
  print('=== Problem 9: Capitalize Words ===');
  print('Problem: Write `capitalizeWords(String input)` to capitalize the first letter of each space-separated word.');
  print('Answer:\n');

  // Solution Code
  String capitalizeWords(String input) {
    if (input.isEmpty) return input;
    return input.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

  // Demonstration
  String sample = "pattern matching and traits";
  print('Input: "$sample"');
  print('Output: "${capitalizeWords(sample)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: Why cannot you directly mutate a single character inside a Rust `&str`?');
  print('A) Rust string references are immutable by default, and `&str` has a fixed byte size.');
  print('B) UTF-8 characters have uniform length of 4 bytes.');
  print('C) Strings in Rust are stored in read-only RAM.');
  print('D) Rust doesn\'t allow char modifications.');
  print('Correct Answer: A) Rust string references are immutable by default, and &str has a fixed byte size.');
}

```

---

### `problem_10.dart` — Parse and Mask Sensitive String Data

```dart
// Problem 10: Masking String Slices
// Rust Context: Efficient memory usage with slice ranges without copying unmasked segments.

void runProblem10() {
  print('=== Problem 10: Mask String Slices ===');
  print('Problem: Write `maskCardNumber(String input)` to show only the last 4 characters and replace all preceding ones with "*".');
  print('Answer:\n');

  // Solution Code
  String maskCardNumber(String input) {
    if (input.length <= 4) return input;
    String lastFour = input.substring(input.length - 4);
    String masked = '*' * (input.length - 4);
    return '$masked$lastFour';
  }

  // Demonstration
  String sample = "1234567890123456";
  print('Input: "$sample"');
  print('Output: "${maskCardNumber(sample)}"\n');

  // MCQ Section
  print('--- Rust MCQ ---');
  print('Question: In Rust, what is the memory representation of a string slice (`&str`)?');
  print('A) A single 64-bit memory address pointer.');
  print('B) A pointer to the byte array and a length value (fat pointer).');
  print('C) A struct containing pointer, length, and capacity.');
  print('D) A null-terminated C string.');
  print('Correct Answer: B) A pointer to the byte array and a length value (fat pointer).');
}

```

---

### Integration in main CLI Runner

In your `bin/main.dart` runner file, you can easily loop through all 10 problem functions to train interns:

```dart
import '../lib/problems/problem_01.dart';
import '../lib/problems/problem_02.dart';
import '../lib/problems/problem_03.dart';
import '../lib/problems/problem_04.dart';
import '../lib/problems/problem_05.dart';
import '../lib/problems/problem_06.dart';
import '../lib/problems/problem_07.dart';
import '../lib/problems/problem_08.dart';
import '../lib/problems/problem_09.dart';
import '../lib/problems/problem_10.dart';

void main(List<String> args) {
  final problems = [
    runProblem01,
    runProblem02,
    runProblem03,
    runProblem04,
    runProblem05,
    runProblem06,
    runProblem07,
    runProblem08,
    runProblem09,
    runProblem10,
  ];

  print("*************************************************");
  print("   DART TO RUST: STRING ALGORITHM PRACTICE CLI  ");
  print("*************************************************\n");

  for (var i = 0; i < problems.length; i++) {
    problems[i]();
    print('\n-------------------------------------------------\n');
  }
}

```

----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------
----------------------------------------------------------------


Here is the command set and instruction guide you can hand directly to your interns to initialize and build their Dart-to-Rust algorithm practice CLI app.

---

### Instructions for Interns

#### Step 1: Create the Dart CLI Project

Open your terminal and run the following command to generate a new console application template using Dart:

```bash
dart create -t cli rust_prep_cli

```

*(Alternatively, you can use `-t console`).*

#### Step 2: Navigate into the Project Directory

```bash
cd rust_prep_cli

```

#### Step 3: Create the Problem Files Directory

Inside your project structure, create a folder named `problems` inside the `lib/` directory:

```bash
mkdir -p lib/problems

```

#### Step 4: Populate the Code Files

1. Create files named `problem_01.dart` through `problem_10.dart` inside `lib/problems/`.
2. Paste the respective problem code, solution function, and Rust MCQ blocks provided previously into each file.

#### Step 5: Setup the Main Entry Point

Open `bin/rust_prep_cli.dart` (or `bin/main.dart` depending on your setup) and wire up the execution loop to cycle through all algorithm practices:

```dart
import 'package:rust_prep_cli/problems/problem_01.dart';
import 'package:rust_prep_cli/problems/problem_02.dart';
import 'package:rust_prep_cli/problems/problem_03.dart';
import 'package:rust_prep_cli/problems/problem_04.dart';
import 'package:rust_prep_cli/problems/problem_05.dart';
import 'package:rust_prep_cli/problems/problem_06.dart';
import 'package:rust_prep_cli/problems/problem_07.dart';
import 'package:rust_prep_cli/problems/problem_08.dart';
import 'package:rust_prep_cli/problems/problem_09.dart';
import 'package:rust_prep_cli/problems/problem_10.dart';

void main(List<String> arguments) {
  final problems = [
    runProblem01,
    runProblem02,
    runProblem03,
    runProblem04,
    runProblem05,
    runProblem06,
    runProblem07,
    runProblem08,
    runProblem09,
    runProblem10,
  ];

  print("*************************************************");
  print("   DART TO RUST: STRING ALGORITHM PRACTICE CLI  ");
  print("*************************************************\n");

  for (var i = 0; i < problems.length; i++) {
    problems[i]();
    print('\n-------------------------------------------------\n');
  }
}

```

#### Step 6: Run the CLI App

Execute the tool locally to verify your code and study the Rust mental models:

```bash
dart run

```

----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------
----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------




----------------------------------------------------------------
----------------------------------------------------------------