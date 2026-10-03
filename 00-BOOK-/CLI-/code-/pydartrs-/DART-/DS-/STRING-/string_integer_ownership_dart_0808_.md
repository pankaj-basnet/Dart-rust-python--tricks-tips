# Dart Classwork — Day 1: CLI App Basics (variables, String, List, Map, functions)

**Track:** Dart fundamentals via a command-line app (new intern cohort, pre-Flutter)
**Goal by end of day:** create a runnable Dart CLI project and be comfortable with `var`/`final`/`const`, `String`, `List`, `Map`, null-safety basics (`?`, `??`), and functions — the same vocabulary used in `Lexeme`, `LexemeSense`, and `LexemeRemoteDataSource` in `daglangdictbloc`.

---

## 1. Topics/Subtopics/Syntax Reference Table

| # | Topic | Subtopic | Syntax | One-line meaning |
|---|-------|----------|--------|-------------------|
| 1 | Variables | Inferred, mutable | `var x = 5;` | Type inferred once, value can change later |
| 2 | Variables | Immutable value | `final x = 5;` | Set once at runtime, can't be reassigned |
| 3 | Variables | Compile-time constant | `const x = 5;` | Must be known at compile time, can't be reassigned |
| 4 | Strings | Literal | `String s = 'saha';` | Text, single or double quotes both work |
| 5 | Strings | Interpolation | `'headword: $s'` | Embeds a variable directly in text |
| 6 | Strings | Expression interpolation | `'len: ${s.length}'` | Embeds an expression, not just a bare variable |
| 7 | Null safety | Nullable type | `String? s;` | `s` may hold `null` — must be handled before use |
| 8 | Null safety | Null-coalescing | `s ?? 'default'` | Use `s` if not null, otherwise fall back |
| 9 | Null safety | Null-aware access | `s?.length` | Safely call a member only if `s` isn't null |
| 10 | Lists | Literal | `List<String> words = ['saha', 'sahabi'];` | Ordered, typed collection |
| 11 | Lists | Access | `words[0]` | Access by position, 0-indexed |
| 12 | Lists | Add | `words.add('sahigu')` | Append one item |
| 13 | Maps | Literal | `Map<String, String> lex = {'headword': 'saha'};` | Key/value collection, like Python's dict |
| 14 | Maps | Safe read | `lex['missing']` | Returns `null` if key is missing (not a crash) |
| 15 | Functions | Definition | `String greet(String name) { return 'Hi $name'; }` | Typed input, typed return |
| 16 | Functions | Arrow syntax | `String greet(String name) => 'Hi $name';` | Shorthand for a single-expression function body |
| 17 | Classes | Basic constructor | `class Lexeme { final String headword; Lexeme(this.headword); }` | Preview only — full OOP comes later |
| 18 | Loops | For-in | `for (final w in words) { ... }` | Iterate a list in order |
| 19 | Collections | `.map()` / `.where()` | `words.map((w) => w.toUpperCase()).toList();` | Functional-style transform/filter, returns a new list |

---

## 2. Variables: `var`, `final`, `const`

```dart
void main() {
  var headword = 'saha';       // type inferred as String; CAN be reassigned
  final limit = 30;            // type inferred as int; CANNOT be reassigned
  const langCode = 'dag';      // compile-time constant

  headword = 'sahabi';         // OK — var allows reassignment
  print('$headword / $limit / $langCode');

  // Error! `final` variables cannot be reassigned after initialization.
  // limit = 50;
  // TODO ^ uncomment to see: Error: 'limit' can't be used as a setter
  //         because it's final.
}
```

---

## 3. Strings and interpolation

```dart
void main() {
  String headword = 'saha';
  int wordLength = headword.length;

  // Bare-variable interpolation with $variable:
  print('Headword: $headword');

  // Expression interpolation needs ${...} for anything beyond a bare name:
  print('Length: ${headword.length}');
  print('Uppercase: ${headword.toUpperCase()}');

  // Error example — forgetting braces for an expression:
  // print('Length: $headword.length');
  // This does NOT throw — but it silently prints "Length: saha.length"
  // instead of the number, because $headword stops at the dot.
  // This is a classic beginner logic bug, not a compiler error — watch for it!
}
```

---

## 4. Null safety: `?`, `??`, `?.`

```dart
void main() {
  // Dart requires you to be explicit about whether a variable can be null.
  String? englishGloss; // nullable — starts out null by default

  // Error! Non-nullable String cannot be assigned null directly.
  // String headword = null;
  // TODO ^ uncomment: Error: A value of type 'Null' can't be assigned
  //         to a variable of type 'String'.

  // Safe pattern #1 — null-coalescing operator: use a fallback if null.
  String displayGloss = englishGloss ?? '(no gloss)';
  print(displayGloss); // "(no gloss)"

  englishGloss = 'time / hour';

  // Safe pattern #2 — null-aware member access: only call .length if not null.
  print(englishGloss?.length); // 11

  String? maybeNull;
  print(maybeNull?.length); // prints "null" — does NOT crash
}
```

---

## 5. Lists

```dart
void main() {
  List<String> words = ['saha', 'sahabi', 'sahayili'];

  print(words[0]);        // 'saha'
  print(words.length);    // 3

  words.add('sahigu');
  print(words);            // [saha, sahabi, sahayili, sahigu]

  // Error example — indexing out of range:
  // print(words[10]);
  // RangeError (index): Invalid value: Not in inclusive range 0..3: 10

  // Functional-style transform, mirrors Python list comprehensions:
  List<String> upper = words.map((w) => w.toUpperCase()).toList();
  print(upper);

  List<String> longWords = words.where((w) => w.length > 5).toList();
  print(longWords); // [sahabi, sahayili, sahigu]
}
```

---

## 6. Maps

```dart
void main() {
  Map<String, String> lexeme = {
    'wikidata_id': 'L12345',
    'headword': 'saha',
    'part_of_speech': 'noun',
  };

  print(lexeme['headword']); // 'saha'

  // Missing key returns null, NOT a crash — same spirit as Python's dict.get().
  print(lexeme['english_gloss']); // null

  // Safe fallback, same idea as Python's .get(key, default):
  String gloss = lexeme['english_gloss'] ?? '';
  print('gloss = "$gloss"');

  // Adding/updating a key:
  lexeme['english_gloss'] = 'time / hour';
  print(lexeme);
}
```

---

## 7. Functions

```dart
// Full syntax — typed parameter, typed return, explicit return statement:
String buildHeadwordLabel(String headword, {String partOfSpeech = 'noun'}) {
  return '$headword ($partOfSpeech)';
}

// Arrow syntax — shorthand for a single-expression function body:
String shout(String s) => s.toUpperCase();

void main() {
  print(buildHeadwordLabel('saha'));                          // saha (noun)
  print(buildHeadwordLabel('sahabi', partOfSpeech: 'noun'));   // named argument
  print(shout('saha'));                                        // SAHA
}
```

---

## 8. Preview: a minimal class (full OOP comes later)

```dart
// This is the shape you'll see for real in Lexeme, LexemeSense, LexemeForm
// once you start reading daglangdictbloc's domain layer.
class Lexeme {
  final String wikidataId;
  final String headword;

  Lexeme(this.wikidataId, this.headword); // constructor shorthand

  @override
  String toString() => 'Lexeme($wikidataId, $headword)';
}

void main() {
  final lex = Lexeme('L12345', 'saha');
  print(lex); // Lexeme(L12345, saha)
}
```

---

## 9. Setting up and running a Dart CLI project (steps)

| # | Step | Command | What happens |
|---|------|---------|----------------|
| 1 | Confirm the Dart SDK is installed | `dart --version` | Confirms `dart` is on PATH (comes bundled with the Flutter SDK too) |
| 2 | Create a new CLI project | `dart create -t console dag_lexeme_cli` | Scaffolds `bin/dag_lexeme_cli.dart` with a starter `void main() { print('Hello world!'); }` |
| 3 | Enter the project | `cd dag_lexeme_cli` | — |
| 4 | Edit the entry file | open `bin/dag_lexeme_cli.dart`, paste today's snippets into `void main() { ... }` | This is where classwork should be pasted for running |
| 5 | Fetch dependencies (if `pubspec.yaml` changed) | `dart pub get` | Downloads packages listed in `pubspec.yaml` |
| 6 | Run the CLI app | `dart run` (or `dart run bin/dag_lexeme_cli.dart`) | Compiles and executes |
| 7 | (Optional) compile to a standalone executable | `dart compile exe bin/dag_lexeme_cli.dart` | Produces a native binary you can run without the Dart SDK installed |

---

## 10. Homework checklist for interns

| # | Task |
|---|------|
| 1 | Fix the `final limit` reassignment error in Section 2 by changing it to `var` |
| 2 | Write a function `List<String> filterByLength(List<String> words, int minLen)` using `.where()` |
| 3 | Build a `Map<String, String>` for one lexeme with a missing key, and safely read it with `??` |
| 4 | Extend the `Lexeme` class in Section 8 with a nullable `String? partOfSpeech` field and print it using `?.` |